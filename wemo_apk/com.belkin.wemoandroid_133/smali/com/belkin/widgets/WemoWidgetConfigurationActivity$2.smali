.class Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;
.super Ljava/lang/Object;
.source "WemoWidgetConfigurationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;


# direct methods
.method constructor <init>(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)V
    .locals 0

    .prologue
    .line 69
    iput-object p1, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 72
    invoke-static {}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "Next button clicked"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$100(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    move-result-object v4

    if-eqz v4, :cond_1

    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$100(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->getSelectedDevice()Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 74
    invoke-static {}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$000()Ljava/lang/String;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Selected position: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v6}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$100(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    move-result-object v6

    invoke-virtual {v6}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->getSelectedPosition()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$100(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationAdapter;->getSelectedDevice()Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 79
    .local v1, "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 80
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v4

    invoke-virtual {v4, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceCapabilities(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v0

    .line 82
    .local v0, "capabilities":Ljava/lang/String;
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 85
    .end local v0    # "capabilities":Ljava/lang/String;
    :cond_0
    new-instance v3, Lcom/belkin/widgets/WidgetData;

    invoke-direct {v3, v1}, Lcom/belkin/widgets/WidgetData;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 86
    .local v3, "widgetData":Lcom/belkin/widgets/WidgetData;
    invoke-static {}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$000()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lcom/belkin/widgets/WidgetData;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    iget-object v5, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v5}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)I

    move-result v5

    invoke-static {v4, v5, v3}, Lcom/belkin/widgets/WidgetUtil;->storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    .line 88
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v3}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v6}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)I

    move-result v6

    invoke-static {v4, v5, v6}, Lcom/belkin/widgets/WidgetUtil;->addWidgetIdToMapping(Landroid/content/Context;Ljava/lang/String;I)V

    .line 90
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->getWidgetProvider()Lcom/belkin/widgets/WemoWidgetProvider;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    iget-object v6, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v6}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)I

    move-result v6

    invoke-virtual {v4, v5, v6, v1}, Lcom/belkin/widgets/WemoWidgetProvider;->initializeWidgetView(Landroid/content/Context;ILcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 92
    new-instance v2, Landroid/content/Intent;

    invoke-direct {v2}, Landroid/content/Intent;-><init>()V

    .line 93
    .local v2, "resultValue":Landroid/content/Intent;
    const-string v4, "appWidgetId"

    iget-object v5, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-static {v5}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$200(Lcom/belkin/widgets/WemoWidgetConfigurationActivity;)I

    move-result v5

    invoke-virtual {v2, v4, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 94
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    const/4 v5, -0x1

    invoke-virtual {v4, v5, v2}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->setResult(ILandroid/content/Intent;)V

    .line 99
    .end local v1    # "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "resultValue":Landroid/content/Intent;
    .end local v3    # "widgetData":Lcom/belkin/widgets/WidgetData;
    :goto_0
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    invoke-virtual {v4}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->finish()V

    .line 100
    return-void

    .line 96
    :cond_1
    invoke-static {}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->access$000()Ljava/lang/String;

    move-result-object v4

    const-string v5, "ListView adapter is null so we can\'t determine the selected device"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v4, p0, Lcom/belkin/widgets/WemoWidgetConfigurationActivity$2;->this$0:Lcom/belkin/widgets/WemoWidgetConfigurationActivity;

    const/4 v5, 0x0

    invoke-virtual {v4, v5}, Lcom/belkin/widgets/WemoWidgetConfigurationActivity;->setResult(I)V

    goto :goto_0
.end method
