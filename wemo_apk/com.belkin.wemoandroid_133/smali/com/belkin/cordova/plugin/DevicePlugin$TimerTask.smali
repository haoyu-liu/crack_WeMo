.class Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;
.super Ljava/lang/Object;
.source "DevicePlugin.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/cordova/plugin/DevicePlugin;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "TimerTask"
.end annotation


# instance fields
.field private mIndex:I

.field final synthetic this$0:Lcom/belkin/cordova/plugin/DevicePlugin;


# direct methods
.method public constructor <init>(Lcom/belkin/cordova/plugin/DevicePlugin;I)V
    .locals 1
    .param p2, "index"    # I

    .prologue
    .line 2622
    iput-object p1, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2621
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->mIndex:I

    .line 2623
    iput p2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->mIndex:I

    .line 2624
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 2628
    const-wide/16 v2, 0x7d0

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 2629
    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1600(Lcom/belkin/cordova/plugin/DevicePlugin;)I

    move-result v2

    iget v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->mIndex:I

    if-ne v2, v3, :cond_0

    .line 2630
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 2631
    .local v1, "intent":Landroid/content/Intent;
    const-string v2, "com.controller.belkin.hybrid.SET_INACTIVE_STATE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2632
    sget-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 2634
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    const-wide/16 v2, 0x32c8

    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 2635
    iget-object v2, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->this$0:Lcom/belkin/cordova/plugin/DevicePlugin;

    invoke-static {v2}, Lcom/belkin/cordova/plugin/DevicePlugin;->access$1600(Lcom/belkin/cordova/plugin/DevicePlugin;)I

    move-result v2

    iget v3, p0, Lcom/belkin/cordova/plugin/DevicePlugin$TimerTask;->mIndex:I

    if-ne v2, v3, :cond_1

    .line 2636
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 2637
    .restart local v1    # "intent":Landroid/content/Intent;
    const-string v2, "com.controller.belkin.hybrid.SET_UNAVAILABLE_STATE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 2638
    sget-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mContext:Landroid/content/Context;

    invoke-virtual {v2, v1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2643
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_1
    :goto_0
    return-void

    .line 2640
    :catch_0
    move-exception v0

    .line 2641
    .local v0, "e":Ljava/lang/InterruptedException;
    const-string v2, "DevicePlugin"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Timer work is interrupt "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
