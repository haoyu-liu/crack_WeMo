.class Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;
.super Ljava/lang/Object;
.source "WemoOneByOneWidgetProvider.java"

# interfaces
.implements Lcom/belkin/controller/WidgetGetDeviceCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->updateDeviceState(Landroid/content/Context;Lcom/belkin/controller/WidgetController;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$oldData:Lcom/belkin/widgets/WidgetData;

.field final synthetic val$widgetId:I


# direct methods
.method constructor <init>(Lcom/belkin/widgets/WemoOneByOneWidgetProvider;Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V
    .locals 0

    .prologue
    .line 101
    iput-object p1, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->this$0:Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    iput-object p2, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$context:Landroid/content/Context;

    iput p3, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$widgetId:I

    iput-object p4, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$oldData:Lcom/belkin/widgets/WidgetData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDeviceOffline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 0
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 111
    invoke-virtual {p0}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->onDeviceUnavailable()V

    .line 112
    return-void
.end method

.method public onDeviceOnline(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 4
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 104
    iget-object v1, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->this$0:Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    iget-object v2, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$context:Landroid/content/Context;

    iget v3, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$widgetId:I

    invoke-virtual {v1, v2, v3, p1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeWidgetView(Landroid/content/Context;ILcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 105
    new-instance v0, Lcom/belkin/widgets/WidgetData;

    invoke-direct {v0, p1}, Lcom/belkin/widgets/WidgetData;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 106
    .local v0, "updatedData":Lcom/belkin/widgets/WidgetData;
    iget-object v1, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$context:Landroid/content/Context;

    iget v2, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$widgetId:I

    invoke-static {v1, v2, v0}, Lcom/belkin/widgets/WidgetUtil;->storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    .line 107
    return-void
.end method

.method public onDeviceUnavailable()V
    .locals 4

    .prologue
    .line 116
    iget-object v0, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->this$0:Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    iget-object v1, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$context:Landroid/content/Context;

    iget v2, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$widgetId:I

    iget-object v3, p0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;->val$oldData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v3}, Lcom/belkin/widgets/WidgetData;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeUnavailableView(Landroid/content/Context;ILjava/lang/String;)V

    .line 117
    return-void
.end method
