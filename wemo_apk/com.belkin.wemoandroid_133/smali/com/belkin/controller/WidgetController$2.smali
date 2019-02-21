.class Lcom/belkin/controller/WidgetController$2;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WidgetController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/controller/WidgetController;->getDeviceFromGroup(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/WidgetController;

.field final synthetic val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

.field final synthetic val$groupId:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/controller/WidgetController;Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
    .locals 0

    .prologue
    .line 108
    iput-object p1, p0, Lcom/belkin/controller/WidgetController$2;->this$0:Lcom/belkin/controller/WidgetController;

    iput-object p2, p0, Lcom/belkin/controller/WidgetController$2;->val$groupId:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/controller/WidgetController$2;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    .prologue
    .line 111
    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v5}, Lcom/belkin/controller/WidgetController;->access$200(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/controller/WidgetController$2;->val$groupId:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v3

    .line 112
    .local v3, "devices":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v2, 0x0

    .line 113
    .local v2, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v3, :cond_1

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_1

    .line 114
    const/4 v5, 0x0

    invoke-interface {v3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    .end local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    check-cast v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 117
    .restart local v2    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 118
    .local v1, "d":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 119
    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v5}, Lcom/belkin/controller/WidgetController;->access$300(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v5, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceCapabilities(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v0

    .line 120
    .local v0, "capabilities":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    goto :goto_0

    .line 125
    .end local v0    # "capabilities":Ljava/lang/String;
    .end local v1    # "d":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_1
    if-eqz v2, :cond_2

    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v5}, Lcom/belkin/controller/WidgetController;->access$300(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v5

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceForWidget(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    if-nez v5, :cond_4

    .line 126
    :cond_2
    if-eqz v2, :cond_3

    .line 127
    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Failed to retrieve bridge device with UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    :cond_3
    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-interface {v5}, Lcom/belkin/controller/WidgetGetDeviceCallback;->onDeviceUnavailable()V

    .line 133
    :goto_1
    return-void

    .line 132
    :cond_4
    iget-object v5, p0, Lcom/belkin/controller/WidgetController$2;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-interface {v5, v2}, Lcom/belkin/controller/WidgetGetDeviceCallback;->onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_1
.end method
