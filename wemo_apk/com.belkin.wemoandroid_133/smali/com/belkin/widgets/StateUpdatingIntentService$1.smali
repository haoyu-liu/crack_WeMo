.class Lcom/belkin/widgets/StateUpdatingIntentService$1;
.super Ljava/lang/Object;
.source "StateUpdatingIntentService.java"

# interfaces
.implements Lcom/belkin/controller/WidgetGetDeviceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/widgets/StateUpdatingIntentService;->onHandleIntent(Landroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

.field final synthetic val$controller:Lcom/belkin/controller/WidgetController;

.field final synthetic val$widgetData:Lcom/belkin/widgets/WidgetData;

.field final synthetic val$widgetId:I


# direct methods
.method constructor <init>(Lcom/belkin/widgets/StateUpdatingIntentService;Lcom/belkin/widgets/WidgetData;Lcom/belkin/controller/WidgetController;I)V
    .locals 0

    .prologue
    .line 49
    iput-object p1, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    iput-object p2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    iput-object p3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$controller:Lcom/belkin/controller/WidgetController;

    iput p4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeviceOffline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 3
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 84
    invoke-static {}, Lcom/belkin/widgets/StateUpdatingIntentService;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Device\'s inActive state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    invoke-virtual {p0}, Lcom/belkin/widgets/StateUpdatingIntentService$1;->onDeviceUnavailable()V

    .line 86
    return-void
.end method

.method public onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 9
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v8, 0x2

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 52
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v0

    .line 53
    .local v0, "deviceState":I
    invoke-static {}, Lcom/belkin/widgets/StateUpdatingIntentService;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "DeviceInformation, WidgetData state: %d, %d"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    iget-object v7, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v7}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v4}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v4

    if-eq v0, v4, :cond_0

    iget-object v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v4}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v4

    const/4 v5, 0x3

    if-ne v4, v5, :cond_2

    .line 57
    :cond_0
    if-nez v0, :cond_1

    move v0, v2

    .line 58
    :goto_0
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v2, v0}, Lcom/belkin/widgets/WidgetData;->setState(I)Z

    .line 59
    new-instance v1, Lcom/belkin/widgets/WidgetStateChangedTask;

    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    iget-object v3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$controller:Lcom/belkin/controller/WidgetController;

    iget v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    iget-object v5, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/belkin/widgets/WidgetStateChangedTask;-><init>(Landroid/content/Context;Lcom/belkin/controller/WidgetController;ILcom/belkin/widgets/WidgetData;)V

    .line 62
    .local v1, "stateChangedTask":Lcom/belkin/widgets/WidgetStateChangedTask;
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$controller:Lcom/belkin/controller/WidgetController;

    invoke-virtual {v2, v1}, Lcom/belkin/controller/WidgetController;->addStateChangedListener(Lcom/belkin/controller/WidgetStateChangedListener;)V

    .line 64
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$controller:Lcom/belkin/controller/WidgetController;

    iget-object v3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-static {v2, v3, p1, v0}, Lcom/belkin/widgets/WidgetUtil;->setDeviceOrGroupState(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;Lcom/belkin/wemo/cache/data/DeviceInformation;I)V

    .line 66
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    iget v3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    iget-object v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-static {v2, v3, v4}, Lcom/belkin/widgets/WidgetUtil;->storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    .line 69
    invoke-static {}, Lcom/belkin/widgets/StateUpdatingIntentService;->access$100()Landroid/os/Handler;

    move-result-object v2

    const-wide/16 v4, 0x1388

    invoke-virtual {v1, v2, v4, v5}, Lcom/belkin/widgets/WidgetStateChangedTask;->postDelayed(Landroid/os/Handler;J)V

    .line 80
    .end local v1    # "stateChangedTask":Lcom/belkin/widgets/WidgetStateChangedTask;
    :goto_1
    return-void

    :cond_1
    move v0, v3

    .line 57
    goto :goto_0

    .line 72
    :cond_2
    invoke-static {}, Lcom/belkin/widgets/StateUpdatingIntentService;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Widget is out of sync; DeviceInformation, WidgetData state: %d, %d"

    new-array v6, v8, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v3

    iget-object v3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v3}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v6, v2

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v4, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v2, v0}, Lcom/belkin/widgets/WidgetData;->setState(I)Z

    .line 76
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    iget v3, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    iget-object v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-static {v2, v3, v4}, Lcom/belkin/widgets/WidgetUtil;->storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    .line 77
    iget-object v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    const-string v3, "refreshState"

    iget v4, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    invoke-static {v2, v3, v4}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_1
.end method

.method public onDeviceUnavailable()V
    .locals 3

    .prologue
    .line 91
    invoke-static {}, Lcom/belkin/widgets/StateUpdatingIntentService;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Device is inActive or can\'t be retrieved"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    iget-object v0, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->this$0:Lcom/belkin/widgets/StateUpdatingIntentService;

    const-string v1, "refreshState"

    iget v2, p0, Lcom/belkin/widgets/StateUpdatingIntentService$1;->val$widgetId:I

    invoke-static {v0, v1, v2}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    .line 94
    return-void
.end method
