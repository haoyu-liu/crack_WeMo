.class Lcom/belkin/controller/DeviceListController$6;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/controller/DeviceListController;->resetDevice(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;[Ljava/lang/Boolean;)Lorg/json/JSONObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/DeviceListController;

.field final synthetic val$device:Lorg/json/JSONObject;

.field final synthetic val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$msgObj:Lorg/json/JSONObject;

.field final synthetic val$resetType:Ljava/lang/String;

.field final synthetic val$stateData:Lorg/json/JSONObject;


# direct methods
.method constructor <init>(Lcom/belkin/controller/DeviceListController;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lorg/json/JSONObject;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 1079
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$6;->this$0:Lcom/belkin/controller/DeviceListController;

    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$6;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    iput-object p3, p0, Lcom/belkin/controller/DeviceListController$6;->val$msgObj:Lorg/json/JSONObject;

    iput-object p4, p0, Lcom/belkin/controller/DeviceListController$6;->val$resetType:Ljava/lang/String;

    iput-object p5, p0, Lcom/belkin/controller/DeviceListController$6;->val$device:Lorg/json/JSONObject;

    iput-object p6, p0, Lcom/belkin/controller/DeviceListController$6;->val$stateData:Lorg/json/JSONObject;

    iput-object p7, p0, Lcom/belkin/controller/DeviceListController$6;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 1083
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$6;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    if-eqz v1, :cond_0

    .line 1084
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$6;->val$errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V

    .line 1087
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$6;->val$msgObj:Lorg/json/JSONObject;

    const-string v2, "error"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error while deleting rules - resetType: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$6;->val$resetType:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",device: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$6;->val$device:Lorg/json/JSONObject;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ",stateData: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/controller/DeviceListController$6;->val$stateData:Lorg/json/JSONObject;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1092
    :goto_0
    iget-object v1, p0, Lcom/belkin/controller/DeviceListController$6;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1093
    return-void

    .line 1089
    :catch_0
    move-exception v0

    .line 1090
    .local v0, "e":Ljava/lang/Exception;
    const-string v1, "DeviceListController"

    const-string v2, "Exception in resetDevice"

    invoke-static {v1, v2, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
