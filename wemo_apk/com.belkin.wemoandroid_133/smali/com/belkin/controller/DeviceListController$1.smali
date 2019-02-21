.class Lcom/belkin/controller/DeviceListController$1;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/controller/DeviceListController;->setBulbType(Lorg/json/JSONObject;Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/controller/DeviceListController;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 274
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$1;->this$0:Lcom/belkin/controller/DeviceListController;

    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBulbTypeSet(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "minLevel"    # Ljava/lang/String;
    .param p2, "maxLevel"    # Ljava/lang/String;
    .param p3, "turnOnLevel"    # Ljava/lang/String;

    .prologue
    .line 278
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 280
    .local v0, "bulbConfigurationJO":Lorg/json/JSONObject;
    :try_start_0
    const-string v3, "maxLevel"

    invoke-virtual {v0, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 281
    const-string v3, "minLevel"

    invoke-virtual {v0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 282
    const-string v3, "turnOnLevel"

    invoke-virtual {v0, v3, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 291
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_1

    .line 292
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3, v0}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    .line 293
    .local v2, "result":Lorg/apache/cordova/PluginResult;
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 295
    .end local v2    # "result":Lorg/apache/cordova/PluginResult;
    :cond_1
    return-void

    .line 283
    :catch_0
    move-exception v1

    .line 284
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "DeviceListController"

    const-string v4, "setBulbType: JSONException while parsing reult: "

    invoke-static {v3, v4, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 286
    new-instance v2, Lorg/apache/cordova/PluginResult;

    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v2, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 287
    .restart local v2    # "result":Lorg/apache/cordova/PluginResult;
    iget-object v3, p0, Lcom/belkin/controller/DeviceListController$1;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v2}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method
