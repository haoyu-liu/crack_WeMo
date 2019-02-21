.class Lcom/belkin/controller/WidgetController$3;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WidgetController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/WidgetController;

.field final synthetic val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

.field final synthetic val$udn:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/controller/WidgetController;Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
    .locals 0

    .prologue
    .line 144
    iput-object p1, p0, Lcom/belkin/controller/WidgetController$3;->this$0:Lcom/belkin/controller/WidgetController;

    iput-object p2, p0, Lcom/belkin/controller/WidgetController$3;->val$udn:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/controller/WidgetController$3;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 147
    iget-object v1, p0, Lcom/belkin/controller/WidgetController$3;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v1}, Lcom/belkin/controller/WidgetController;->access$300(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/controller/WidgetController$3;->val$udn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceForWidget(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 148
    .local v0, "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v0, :cond_0

    .line 149
    iget-object v1, p0, Lcom/belkin/controller/WidgetController$3;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-interface {v1}, Lcom/belkin/controller/WidgetGetDeviceCallback;->onDeviceUnavailable()V

    .line 155
    :goto_0
    return-void

    .line 150
    :cond_0
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v1

    if-eqz v1, :cond_1

    .line 151
    iget-object v1, p0, Lcom/belkin/controller/WidgetController$3;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-interface {v1, v0}, Lcom/belkin/controller/WidgetGetDeviceCallback;->onDeviceOffline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_0

    .line 153
    :cond_1
    iget-object v1, p0, Lcom/belkin/controller/WidgetController$3;->val$callback:Lcom/belkin/controller/WidgetGetDeviceCallback;

    invoke-interface {v1, v0}, Lcom/belkin/controller/WidgetGetDeviceCallback;->onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_0
.end method
