.class Lcom/belkin/cordova/plugin/SmartDevicePlugin$1;
.super Ljava/util/TimerTask;
.source "SmartDevicePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/cordova/plugin/SmartDevicePlugin;->enableRemoteAccess()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)V
    .locals 0

    .prologue
    .line 903
    iput-object p1, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 907
    :try_start_0
    sget-object v3, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setRemoteAccess()Lorg/json/JSONArray;

    move-result-object v1

    .line 908
    .local v1, "jsonArray":Lorg/json/JSONArray;
    const/4 v3, 0x0

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->getBoolean(I)Z

    move-result v2

    .line 909
    .local v2, "result":Z
    if-eqz v2, :cond_0

    .line 910
    iget-object v3, p0, Lcom/belkin/cordova/plugin/SmartDevicePlugin$1;->this$0:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->access$000(Lcom/belkin/cordova/plugin/SmartDevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setRemoteAutoEnableNeeded(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 915
    .end local v1    # "jsonArray":Lorg/json/JSONArray;
    .end local v2    # "result":Z
    :cond_0
    :goto_0
    return-void

    .line 912
    :catch_0
    move-exception v0

    .line 913
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
