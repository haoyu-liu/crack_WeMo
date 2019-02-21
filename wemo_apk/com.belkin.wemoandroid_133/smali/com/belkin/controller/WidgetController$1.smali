.class Lcom/belkin/controller/WidgetController$1;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "WidgetController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/controller/WidgetController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/controller/WidgetController;


# direct methods
.method constructor <init>(Lcom/belkin/controller/WidgetController;)V
    .locals 0

    .prologue
    .line 35
    iput-object p1, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 38
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->TAG:Ljava/lang/String;

    const-string v3, "onUpdate timeout reached; stopping device list manager"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 39
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground()Z

    move-result v2

    if-nez v2, :cond_0

    .line 40
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-virtual {v2}, Lcom/belkin/controller/WidgetController;->pauseDeviceListManager()V

    .line 42
    :cond_0
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v2}, Lcom/belkin/controller/WidgetController;->access$000(Lcom/belkin/controller/WidgetController;)Ljava/util/Set;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 43
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v2}, Lcom/belkin/controller/WidgetController;->access$000(Lcom/belkin/controller/WidgetController;)Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 44
    .local v1, "widgetId":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v2}, Lcom/belkin/controller/WidgetController;->access$100(Lcom/belkin/controller/WidgetController;)Landroid/content/Context;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    invoke-static {v2, v3}, Lcom/belkin/widgets/WidgetUtil;->getProviderClassForWidget(Landroid/content/Context;I)Ljava/lang/Class;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 45
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    invoke-static {v2}, Lcom/belkin/controller/WidgetController;->access$100(Lcom/belkin/controller/WidgetController;)Landroid/content/Context;

    move-result-object v2

    const-string v3, "automaticUpdate"

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    invoke-static {v2, v3, v4}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0

    .line 48
    .end local v1    # "widgetId":Ljava/lang/String;
    :cond_2
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->this$0:Lcom/belkin/controller/WidgetController;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/belkin/controller/WidgetController;->access$002(Lcom/belkin/controller/WidgetController;Ljava/util/Set;)Ljava/util/Set;

    .line 52
    .end local v0    # "i$":Ljava/util/Iterator;
    :goto_1
    return-void

    .line 50
    :cond_3
    iget-object v2, p0, Lcom/belkin/controller/WidgetController$1;->TAG:Ljava/lang/String;

    const-string v3, "setDeviceListManagerTimeout - setOfWidgetIds is already null"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
