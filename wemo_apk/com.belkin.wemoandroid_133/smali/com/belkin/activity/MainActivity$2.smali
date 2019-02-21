.class Lcom/belkin/activity/MainActivity$2;
.super Landroid/content/BroadcastReceiver;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/activity/MainActivity;->registerNetworkChangeBroadcastReceiver()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/activity/MainActivity;


# direct methods
.method constructor <init>(Lcom/belkin/activity/MainActivity;)V
    .locals 0

    .prologue
    .line 447
    iput-object p1, p0, Lcom/belkin/activity/MainActivity$2;->this$0:Lcom/belkin/activity/MainActivity;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 450
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 451
    .local v0, "action":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/activity/MainActivity;->access$000()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Connectivity: Broadcast Received. Action: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 452
    const-string v5, "com.wemo.belkin.NETWORK_SWICTHED"

    invoke-virtual {v0, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 453
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 454
    invoke-static {}, Lcom/belkin/activity/MainActivity;->access$000()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Connectivity: App in Foreground. RESTARTING WEMO APP."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 456
    new-instance v4, Landroid/content/Intent;

    const-class v5, Lcom/belkin/activity/MainActivity;

    invoke-direct {v4, p1, v5}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 457
    .local v4, "restartIntent":Landroid/content/Intent;
    const v5, 0x4008000

    invoke-virtual {v4, v5}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 460
    const/4 v2, 0x1

    .line 461
    .local v2, "mPendingIntentId":I
    const/high16 v5, 0x10000000

    invoke-static {p1, v2, v4, v5}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    .line 464
    .local v1, "mPendingIntent":Landroid/app/PendingIntent;
    const-string v5, "alarm"

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/AlarmManager;

    .line 465
    .local v3, "mgr":Landroid/app/AlarmManager;
    const/4 v5, 0x1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    const-wide/16 v8, 0x3e8

    add-long/2addr v6, v8

    invoke-virtual {v3, v5, v6, v7, v1}, Landroid/app/AlarmManager;->set(IJLandroid/app/PendingIntent;)V

    .line 467
    const/4 v5, 0x0

    invoke-static {v5}, Ljava/lang/System;->exit(I)V

    .line 475
    .end local v1    # "mPendingIntent":Landroid/app/PendingIntent;
    .end local v2    # "mPendingIntentId":I
    .end local v3    # "mgr":Landroid/app/AlarmManager;
    .end local v4    # "restartIntent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return-void

    .line 471
    :cond_1
    invoke-static {}, Lcom/belkin/activity/MainActivity;->access$000()Ljava/lang/String;

    move-result-object v5

    const-string v6, "Connectivity: App in Background. KILLING WEMO APP."

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    iget-object v5, p0, Lcom/belkin/activity/MainActivity$2;->this$0:Lcom/belkin/activity/MainActivity;

    invoke-virtual {v5}, Lcom/belkin/activity/MainActivity;->finish()V

    goto :goto_0
.end method
