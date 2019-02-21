.class Lcom/belkin/controller/DeviceListController$5;
.super Ljava/lang/Object;
.source "DeviceListController.java"

# interfaces
.implements Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;


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

.field final synthetic val$latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method constructor <init>(Lcom/belkin/controller/DeviceListController;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    .prologue
    .line 1071
    iput-object p1, p0, Lcom/belkin/controller/DeviceListController$5;->this$0:Lcom/belkin/controller/DeviceListController;

    iput-object p2, p0, Lcom/belkin/controller/DeviceListController$5;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAllDeviceRulesReset(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 1076
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$5;->this$0:Lcom/belkin/controller/DeviceListController;

    invoke-static {v0}, Lcom/belkin/controller/DeviceListController;->access$000(Lcom/belkin/controller/DeviceListController;)Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    const/4 v0, 0x0

    check-cast v0, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    invoke-virtual {v1, p1, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshLongPressRuleDetails(Ljava/lang/String;Lcom/belkin/wemo/rules/data/RMLongPressRule;)V

    .line 1077
    iget-object v0, p0, Lcom/belkin/controller/DeviceListController$5;->val$latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1078
    return-void
.end method
