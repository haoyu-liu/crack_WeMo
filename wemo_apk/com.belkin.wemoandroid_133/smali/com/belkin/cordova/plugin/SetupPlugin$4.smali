.class Lcom/belkin/cordova/plugin/SetupPlugin$4;
.super Ljava/lang/Object;
.source "SetupPlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SetupPlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;

.field final synthetic val$inParamArray:Lorg/json/JSONArray;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 359
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$inParamArray:Lorg/json/JSONArray;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 363
    :try_start_0
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v7

    invoke-virtual {v7}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->enableRemoteAccess()Lorg/json/JSONObject;

    move-result-object v2

    .line 364
    .local v2, "obj":Lorg/json/JSONObject;
    const-string v4, ""

    .line 365
    .local v4, "status":Ljava/lang/String;
    const/4 v5, 0x0

    .line 366
    .local v5, "statusSuccess":Z
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lorg/json/JSONObject;->length()I

    move-result v7

    if-lez v7, :cond_1

    .line 367
    const-string v7, "statusCode"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_1

    .line 368
    const-string v7, "statusCode"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 370
    if-eqz v4, :cond_1

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_1

    .line 371
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V

    .line 372
    const-string v7, "S"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_1

    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$inParamArray:Lorg/json/JSONArray;

    if-eqz v7, :cond_1

    .line 373
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 374
    .local v1, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$inParamArray:Lorg/json/JSONArray;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 375
    .local v6, "wifiSSID":Ljava/lang/String;
    invoke-virtual {v1, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 376
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    invoke-virtual {v7, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 377
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    invoke-virtual {v7, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAccessSSID(Ljava/lang/String;)Z

    .line 378
    const-string v7, "privateKeyPhone"

    invoke-virtual {v2, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 379
    .local v3, "privateKey":Ljava/lang/String;
    const-string v7, "NOKEY"

    invoke-virtual {v3, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 380
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    invoke-virtual {v7, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storePrivateKey(Ljava/lang/String;)V

    .line 383
    :cond_0
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    const-string v8, "homeId"

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->storeHomeId(Ljava/lang/String;)V

    .line 384
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v7}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$300(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v7

    const/4 v8, 0x1

    invoke-virtual {v7, v8}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteEnabled(Z)Z

    .line 385
    const/4 v5, 0x1

    .line 388
    const-string v7, "SetupPlugin"

    const-string v8, "ACTION_ENABLE_REMOTE_ACCESS successful. Registering for Push Notifications..."

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 389
    invoke-static {}, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->getInstance()Lcom/belkin/wemo/push/IPushNotification;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v8}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$000(Lcom/belkin/cordova/plugin/SetupPlugin;)Landroid/content/Context;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-interface {v7, v8, v9, v10}, Lcom/belkin/wemo/push/IPushNotification;->registerPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;)V

    .line 394
    .end local v1    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v3    # "privateKey":Ljava/lang/String;
    .end local v6    # "wifiSSID":Ljava/lang/String;
    :cond_1
    if-eqz v5, :cond_2

    .line 395
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v7, v4}, Lorg/apache/cordova/CallbackContext;->success(Ljava/lang/String;)V

    .line 403
    .end local v2    # "obj":Lorg/json/JSONObject;
    .end local v4    # "status":Ljava/lang/String;
    .end local v5    # "statusSuccess":Z
    :goto_0
    return-void

    .line 397
    .restart local v2    # "obj":Lorg/json/JSONObject;
    .restart local v4    # "status":Ljava/lang/String;
    .restart local v5    # "statusSuccess":Z
    :cond_2
    iget-object v7, p0, Lcom/belkin/cordova/plugin/SetupPlugin$4;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    const-string v8, "Set Up Plugin Error"

    invoke-virtual {v7, v8}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 399
    .end local v2    # "obj":Lorg/json/JSONObject;
    .end local v4    # "status":Ljava/lang/String;
    .end local v5    # "statusSuccess":Z
    :catch_0
    move-exception v0

    .line 400
    .local v0, "e":Lorg/json/JSONException;
    invoke-virtual {v0}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method
