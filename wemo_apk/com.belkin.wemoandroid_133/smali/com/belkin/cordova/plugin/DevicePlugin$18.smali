.class Lcom/belkin/cordova/plugin/DevicePlugin$18;
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

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 1902
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    const/4 v4, 0x0

    const-wide/32 v2, 0x3d090

    .line 1907
    :try_start_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iget-object v1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->openBridgeNetwork()Lorg/json/JSONArray;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONArray;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1915
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1916
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1917
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1920
    :cond_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    invoke-static {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1921
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 1922
    const-string v0, "DevicePlugin"

    const-string v1, "PERIODIC OPEN NETWORK TASK SCHEDULED"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1924
    :goto_0
    return-void

    .line 1908
    :catch_0
    move-exception v6

    .line 1909
    .local v6, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v0, "DevicePlugin"

    const-string v1, "Exception in opening bridge Network: "

    invoke-static {v0, v1, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 1910
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 1911
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;->resetOpenBridgeCounter()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1915
    :cond_1
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 1916
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1917
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1920
    :cond_2
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    invoke-static {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1921
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 1922
    const-string v0, "DevicePlugin"

    const-string v1, "PERIODIC OPEN NETWORK TASK SCHEDULED"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1915
    .end local v6    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v0

    move-object v7, v0

    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    if-eqz v0, :cond_3

    .line 1916
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 1917
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0, v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1920
    :cond_3
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    new-instance v1, Ljava/util/Timer;

    invoke-direct {v1}, Ljava/util/Timer;-><init>()V

    invoke-static {v0, v1}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$902(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/util/Timer;)Ljava/util/Timer;

    .line 1921
    iget-object v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v0}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$900(Lcom/belkin/cordova/plugin/DevicePlugin;)Ljava/util/Timer;

    move-result-object v0

    new-instance v1, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$18;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v4}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$000(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;

    move-result-object v4

    invoke-direct {v1, v4}, Lcom/belkin/cordova/plugin/timertask/OpenNetworkTimerTask;-><init>(Lcom/belkin/cybergarage/wrapper/UpnpDeviceList;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;JJ)V

    .line 1922
    const-string v0, "DevicePlugin"

    const-string v1, "PERIODIC OPEN NETWORK TASK SCHEDULED"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    throw v7
.end method
