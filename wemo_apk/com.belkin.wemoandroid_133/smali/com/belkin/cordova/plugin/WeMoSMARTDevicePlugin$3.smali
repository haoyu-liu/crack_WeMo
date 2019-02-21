.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;
.super Ljava/lang/Object;
.source "WeMoSMARTDevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->callAction(Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
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
    .line 296
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 13

    .prologue
    .line 299
    const/4 v7, 0x0

    .line 301
    .local v7, "strOutput":Ljava/lang/String;
    const/4 v4, 0x0

    .line 302
    .local v4, "output":Lorg/json/JSONObject;
    const/4 v3, 0x0

    .line 305
    .local v3, "error":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v9

    const/4 v10, 0x4

    if-lt v9, v10, :cond_9

    .line 307
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    const/4 v10, 0x0

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v8

    .line 308
    .local v8, "udn":Ljava/lang/String;
    if-eqz v8, :cond_8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_8

    .line 309
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    const/4 v10, 0x1

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 310
    .local v6, "service":Ljava/lang/String;
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    const/4 v10, 0x2

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 311
    .local v0, "action":Ljava/lang/String;
    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v9

    if-lez v9, :cond_7

    .line 312
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    const/4 v10, 0x3

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "data"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 314
    .local v1, "arguments":Lorg/json/JSONObject;
    const-string v9, "SetAttributes"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 315
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v9, v1, v8}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$300(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONObject;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 316
    .local v5, "parsedArgument":Ljava/lang/String;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "attributeList"

    invoke-virtual {v9, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 318
    .end local v5    # "parsedArgument":Ljava/lang/String;
    :cond_0
    const-string v9, "SetBlobStorage"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1

    .line 319
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v9, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$400(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    .line 320
    .restart local v5    # "parsedArgument":Ljava/lang/String;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "attributeList"

    invoke-virtual {v9, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 322
    .end local v5    # "parsedArgument":Ljava/lang/String;
    :cond_1
    const-string v9, "GetBlobStorage"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2

    .line 323
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v9, v1}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$400(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v5

    .line 324
    .restart local v5    # "parsedArgument":Ljava/lang/String;
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9}, Lorg/json/JSONObject;-><init>()V

    const-string v10, "attributeList"

    invoke-virtual {v9, v10, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v1

    .line 327
    .end local v5    # "parsedArgument":Ljava/lang/String;
    :cond_2
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-static {v9}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$100(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v9

    invoke-virtual {v9, v8, v6, v0, v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->callAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v4

    .line 328
    if-nez v4, :cond_4

    .line 329
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "No action ("

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ") response UDN: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v3

    .line 350
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "arguments":Lorg/json/JSONObject;
    .end local v6    # "service":Ljava/lang/String;
    .end local v8    # "udn":Ljava/lang/String;
    :cond_3
    :goto_0
    const-string v10, "WeMoSMARTDevicePlugin"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "output msg: "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    if-nez v7, :cond_a

    move-object v9, v4

    :goto_1
    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v10, v9}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 351
    if-eqz v3, :cond_b

    .line 353
    :try_start_1
    const-string v9, "WeMoSMARTDevicePlugin"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Call action error: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "UDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$args:Lorg/json/JSONArray;

    const/4 v12, 0x0

    invoke-virtual {v11, v12}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 358
    :goto_2
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v9, v3}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    .line 368
    :goto_3
    return-void

    .line 331
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v1    # "arguments":Lorg/json/JSONObject;
    .restart local v6    # "service":Ljava/lang/String;
    .restart local v8    # "udn":Ljava/lang/String;
    :cond_4
    :try_start_2
    const-string v9, "GetAttributes"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_5

    .line 332
    new-instance v9, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;

    invoke-direct {v9}, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;-><init>()V

    const-string v10, "attributeList"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Lcom/belkin/upnp/parser/GenericGetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    goto :goto_0

    .line 333
    :cond_5
    const-string v9, "GetRules"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_6

    const-string v9, "SetRules"

    invoke-virtual {v0, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_3

    .line 334
    :cond_6
    const-string v9, "ruleList"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    goto :goto_0

    .line 339
    .end local v1    # "arguments":Lorg/json/JSONObject;
    :cond_7
    const-string v3, "Invalid action"

    goto :goto_0

    .line 342
    .end local v0    # "action":Ljava/lang/String;
    .end local v6    # "service":Ljava/lang/String;
    :cond_8
    const-string v3, "Invalid UDN"

    goto :goto_0

    .line 345
    .end local v8    # "udn":Ljava/lang/String;
    :cond_9
    const-string v3, "Missing parameters"
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto/16 :goto_0

    .line 347
    :catch_0
    move-exception v2

    .line 348
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v3

    goto/16 :goto_0

    .end local v2    # "e":Ljava/lang/Exception;
    :cond_a
    move-object v9, v7

    .line 350
    goto :goto_1

    .line 354
    :catch_1
    move-exception v2

    .line 356
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 361
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_b
    if-nez v7, :cond_c

    .line 362
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v9, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    goto :goto_3

    .line 364
    :cond_c
    iget-object v9, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v9, v7}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    goto :goto_3
.end method
