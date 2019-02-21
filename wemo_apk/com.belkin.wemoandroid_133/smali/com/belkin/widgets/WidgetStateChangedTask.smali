.class Lcom/belkin/widgets/WidgetStateChangedTask;
.super Ljava/lang/Object;
.source "WidgetStateChangedTask.java"

# interfaces
.implements Ljava/lang/Runnable;
.implements Lcom/belkin/controller/WidgetStateChangedListener;
.implements Ljava/lang/Comparable;


# instance fields
.field private context:Landroid/content/Context;

.field private controller:Lcom/belkin/controller/WidgetController;

.field private handler:Landroid/os/Handler;

.field private widgetData:Lcom/belkin/widgets/WidgetData;

.field private widgetId:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/controller/WidgetController;ILcom/belkin/widgets/WidgetData;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p3, "widgetId"    # I
    .param p4, "widgetData"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p3, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetId:I

    .line 20
    iput-object p2, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->controller:Lcom/belkin/controller/WidgetController;

    .line 21
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->context:Landroid/content/Context;

    .line 22
    iput-object p4, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetData:Lcom/belkin/widgets/WidgetData;

    .line 23
    return-void
.end method


# virtual methods
.method public appliesToDevice(Ljava/lang/String;)Z
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 61
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v0}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public compareTo(Ljava/lang/Object;)I
    .locals 2
    .param p1, "another"    # Ljava/lang/Object;

    .prologue
    .line 66
    iget v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetId:I

    check-cast p1, Lcom/belkin/widgets/WidgetStateChangedTask;

    .end local p1    # "another":Ljava/lang/Object;
    invoke-virtual {p1}, Lcom/belkin/widgets/WidgetStateChangedTask;->getWidgetId()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public deviceStateChanged(Landroid/content/Context;Ljava/lang/String;Z)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "success"    # Z

    .prologue
    .line 41
    if-eqz p3, :cond_0

    .line 42
    invoke-virtual {p0}, Lcom/belkin/widgets/WidgetStateChangedTask;->run()V

    .line 43
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->handler:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 44
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 47
    :cond_0
    return-void
.end method

.method public getState()I
    .locals 1

    .prologue
    .line 56
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetData:Lcom/belkin/widgets/WidgetData;

    invoke-virtual {v0}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v0

    return v0
.end method

.method public getWidgetId()I
    .locals 1

    .prologue
    .line 51
    iget v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetId:I

    return v0
.end method

.method public postDelayed(Landroid/os/Handler;J)V
    .locals 0
    .param p1, "handler"    # Landroid/os/Handler;
    .param p2, "delayMs"    # J

    .prologue
    .line 26
    iput-object p1, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->handler:Landroid/os/Handler;

    .line 27
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 28
    invoke-virtual {p1, p0, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 29
    return-void
.end method

.method public run()V
    .locals 3

    .prologue
    .line 33
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->controller:Lcom/belkin/controller/WidgetController;

    invoke-virtual {v0, p0}, Lcom/belkin/controller/WidgetController;->removeStateChangedListener(Lcom/belkin/controller/WidgetStateChangedListener;)V

    .line 34
    iget-object v0, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->context:Landroid/content/Context;

    const-string v1, "refreshState"

    iget v2, p0, Lcom/belkin/widgets/WidgetStateChangedTask;->widgetId:I

    invoke-static {v0, v1, v2}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    .line 35
    return-void
.end method
