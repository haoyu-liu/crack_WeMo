.class Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;
.super Landroid/content/BroadcastReceiver;
.source "WeMoSMARTDevicePlugin.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DeviceChangeReceiver"
.end annotation


# instance fields
.field private intentFilter:Landroid/content/IntentFilter;

.field private mDeviceChangeCallbacks:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lorg/apache/cordova/CallbackContext;",
            ">;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;)V
    .locals 2

    .prologue
    .line 512
    iput-object p1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 509
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->mDeviceChangeCallbacks:Ljava/util/Map;

    .line 510
    new-instance v0, Landroid/content/IntentFilter;

    const-string v1, "com.controller.belkin.hybrid.STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->intentFilter:Landroid/content/IntentFilter;

    .line 513
    iget-object v0, p1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->intentFilter:Landroid/content/IntentFilter;

    invoke-virtual {v0, p0, v1}, Landroid/app/Activity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 514
    const/4 v0, 0x1

    invoke-static {p1, v0}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->access$602(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;Z)Z

    .line 515
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;)Landroid/content/IntentFilter;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    .prologue
    .line 507
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->intentFilter:Landroid/content/IntentFilter;

    return-object v0
.end method

.method static synthetic access$700(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;)Ljava/util/Map;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;

    .prologue
    .line 507
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->mDeviceChangeCallbacks:Ljava/util/Map;

    return-object v0
.end method


# virtual methods
.method public addDevice(Ljava/lang/String;Lorg/apache/cordova/CallbackContext;)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "callbackContext"    # Lorg/apache/cordova/CallbackContext;

    .prologue
    .line 527
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->mDeviceChangeCallbacks:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 528
    return-void
.end method

.method public finalize()V
    .locals 1

    .prologue
    .line 521
    :try_start_0
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iget-object v0, v0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v0}, Lorg/apache/cordova/CordovaInterface;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/app/Activity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 524
    :goto_0
    return-void

    .line 522
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 536
    move-object v0, p2

    .line 537
    .local v0, "intentT":Landroid/content/Intent;
    iget-object v1, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->this$0:Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;

    iget-object v1, v1, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin;->cordova:Lorg/apache/cordova/CordovaInterface;

    invoke-interface {v1}, Lorg/apache/cordova/CordovaInterface;->getThreadPool()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    new-instance v2, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;

    invoke-direct {v2, p0, v0}, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver$1;-><init>(Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;Landroid/content/Intent;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    .line 591
    return-void
.end method

.method public removeDevice(Ljava/lang/String;)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 531
    iget-object v0, p0, Lcom/belkin/cordova/plugin/WeMoSMARTDevicePlugin$DeviceChangeReceiver;->mDeviceChangeCallbacks:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 532
    return-void
.end method
