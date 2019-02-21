.class public Lcom/belkin/widgets/WemoOneByThreeWidgetProvider;
.super Lcom/belkin/widgets/WemoOneByOneWidgetProvider;
.source "WemoOneByThreeWidgetProvider.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;-><init>()V

    return-void
.end method


# virtual methods
.method protected generateLauncherIntent(Landroid/content/Context;)Landroid/app/PendingIntent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 28
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.MAIN"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 29
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "android.intent.category.LAUNCHER"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    .line 30
    const-class v1, Lcom/belkin/activity/MainActivity;

    invoke-virtual {v0, p1, v1}, Landroid/content/Intent;->setClass(Landroid/content/Context;Ljava/lang/Class;)Landroid/content/Intent;

    .line 31
    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 32
    const/4 v1, 0x0

    const/high16 v2, 0x8000000

    invoke-static {p1, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v1

    return-object v1
.end method

.method protected generateRemoteView(Landroid/content/Context;ILjava/lang/String;ZLcom/belkin/widgets/WidgetData;)Landroid/widget/RemoteViews;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "image"    # I
    .param p3, "name"    # Ljava/lang/String;
    .param p4, "stateChanging"    # Z
    .param p5, "data"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 18
    new-instance v0, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f030007

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 19
    .local v0, "remoteViews":Landroid/widget/RemoteViews;
    const v1, 0x7f090018

    invoke-virtual {p0, p1}, Lcom/belkin/widgets/WemoOneByThreeWidgetProvider;->generateLauncherIntent(Landroid/content/Context;)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 20
    const v1, 0x7f090012

    invoke-virtual {v0, v1, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 21
    const v1, 0x7f090016

    invoke-static {p5}, Lcom/belkin/widgets/WidgetUtil;->getLightLevelString(Lcom/belkin/widgets/WidgetData;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 22
    const v1, 0x7f090013

    invoke-virtual {v0, v1, p2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 23
    const v2, 0x7f090014

    if-eqz p4, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 24
    return-object v0

    .line 23
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method
