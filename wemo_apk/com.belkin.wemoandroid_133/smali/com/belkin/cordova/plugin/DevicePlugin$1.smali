.class Lcom/belkin/cordova/plugin/DevicePlugin$1;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


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


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;)V
    .locals 0

    .prologue
    .line 226
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 229
    const/4 v1, 0x0

    .line 230
    .local v1, "status":Z
    :try_start_0
    sget-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v2, :cond_1

    .line 231
    sget-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mDLM:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->recreateControlPoint()Z

    move-result v1

    .line 235
    :goto_0
    if-eqz v1, :cond_0

    .line 237
    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->UpnpInitialization()Z

    .line 243
    :cond_0
    :goto_1
    return-void

    .line 233
    :cond_1
    const-string v2, "DevicePlugin"

    const-string v3, "mDLM is null"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 239
    :catch_0
    move-exception v0

    .line 240
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method
