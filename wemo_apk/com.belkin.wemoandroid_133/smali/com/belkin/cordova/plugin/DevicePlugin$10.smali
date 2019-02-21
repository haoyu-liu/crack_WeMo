.class Lcom/belkin/cordova/plugin/DevicePlugin$10;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Lcom/belkin/rules/utils/WeeklyCalenderStringsHandler$AllDevicesScheduleStringSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;->execute(Ljava/lang/String;Lorg/json/JSONArray;Lorg/apache/cordova/CallbackContext;)Z
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
    .line 1370
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$10;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$10;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Lorg/json/JSONObject;)V
    .locals 3
    .param p1, "udnsJSONObject"    # Lorg/json/JSONObject;

    .prologue
    .line 1374
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$10;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v0, :cond_0

    .line 1375
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$10;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    new-instance v1, Lorg/apache/cordova/PluginResult;

    sget-object v2, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v2, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Lorg/json/JSONObject;)V

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1377
    :cond_0
    return-void
.end method
