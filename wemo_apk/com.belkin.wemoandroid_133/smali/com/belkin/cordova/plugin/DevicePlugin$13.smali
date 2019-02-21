.class Lcom/belkin/cordova/plugin/DevicePlugin$13;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


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

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;

.field final synthetic val$newDBVersion:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;Ljava/lang/String;Lorg/apache/cordova/CallbackContext;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 1564
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    iput-object p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$newDBVersion:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    iput-object p4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 6
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "response"    # [B

    .prologue
    .line 1568
    const/4 v1, 0x0

    .line 1569
    .local v1, "pr":Lorg/apache/cordova/PluginResult;
    if-eqz p1, :cond_1

    .line 1570
    new-instance v0, Lcom/belkin/utils/UploadFileUtil;

    invoke-direct {v0}, Lcom/belkin/utils/UploadFileUtil;-><init>()V

    .line 1571
    .local v0, "mUploadFileUtil":Lcom/belkin/utils/UploadFileUtil;
    const/4 v2, 0x0

    .line 1572
    .local v2, "pragmaVersion":Ljava/lang/String;
    const-string v3, "DevicePlugin"

    const-string v4, "Converting ZIP DB from byte[] to rules DB for use."

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1573
    sget-object v3, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v0, p3, v3}, Lcom/belkin/utils/UploadFileUtil;->writeFile([BLandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    .line 1574
    const-string v3, "DevicePlugin"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "pragma Version: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1576
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v3}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$600(Lcom/belkin/cordova/plugin/DevicePlugin;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$newDBVersion:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 1578
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 1579
    new-instance v1, Lorg/apache/cordova/PluginResult;

    .end local v1    # "pr":Lorg/apache/cordova/PluginResult;
    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->OK:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3, v2}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;Ljava/lang/String;)V

    .line 1580
    .restart local v1    # "pr":Lorg/apache/cordova/PluginResult;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    .line 1589
    .end local v0    # "mUploadFileUtil":Lcom/belkin/utils/UploadFileUtil;
    .end local v2    # "pragmaVersion":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v3}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1590
    return-void

    .line 1584
    :cond_1
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_0

    .line 1585
    new-instance v1, Lorg/apache/cordova/PluginResult;

    .end local v1    # "pr":Lorg/apache/cordova/PluginResult;
    sget-object v3, Lorg/apache/cordova/PluginResult$Status;->ERROR:Lorg/apache/cordova/PluginResult$Status;

    invoke-direct {v1, v3}, Lorg/apache/cordova/PluginResult;-><init>(Lorg/apache/cordova/PluginResult$Status;)V

    .line 1586
    .restart local v1    # "pr":Lorg/apache/cordova/PluginResult;
    iget-object v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$13;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3, v1}, Lorg/apache/cordova/CallbackContext;->sendPluginResult(Lorg/apache/cordova/PluginResult;)V

    goto :goto_0
.end method
