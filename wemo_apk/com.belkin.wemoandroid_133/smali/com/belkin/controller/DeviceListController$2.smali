.class Lcom/belkin/controller/DeviceListController$2;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;


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
    .line 296
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$2;->this$0:Lcom/belkin/controller/DeviceListController;

    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSetBulbTypeFailed(Ljava/lang/String;)V
    .locals 2
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 300
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v1, :cond_0

    .line 301
    new-instance v0, Lorg/apache/cordova/PluginResult;

    sget-object v1, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v0, v1, p1}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 302
    .local v0, "result":Lorg/apache/cordova/PluginResult;
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v1, v0}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 304
    .end local v0    # "result":Lorg/apache/cordova/PluginResult;
    :cond_0
    return-void
.end method
