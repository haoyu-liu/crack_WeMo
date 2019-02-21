.class Lcom/belkin/cordova/plugin/SetupPlugin$3;
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


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SetupPlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 266
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$3;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/SetupPlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 269
    :try_start_0
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$3;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    iget-object v1, v1, Lcom/belkin/cordova/plugin/SetupPlugin;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDevicePairingStatus(Z)V

    .line 270
    iget-object v1, p0, Lcom/belkin/cordova/plugin/SetupPlugin$3;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v2, p0, Lcom/belkin/cordova/plugin/SetupPlugin$3;->this$0:Lcom/belkin/cordova/plugin/SetupPlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/SetupPlugin;->access$100(Lcom/belkin/cordova/plugin/SetupPlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceSetup;->getAllApList()Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 274
    :goto_0
    return-void

    .line 271
    :catch_0
    move-exception v0

    .line 272
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
