.class public Lcom/belkin/widgets/WemoOneByOneWidgetProvider;
.super Lcom/belkin/widgets/WemoWidgetProvider;
.source "WemoOneByOneWidgetProvider.java"


# static fields
.field public static final AUTOMATIC_UPDATE:Ljava/lang/String; = "automaticUpdate"

.field public static final REFRESH_STATE:Ljava/lang/String; = "refreshState"

.field public static final STATE_UPDATING:Ljava/lang/String; = "stateUpdating"

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 18
    const-class v0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Lcom/belkin/widgets/WemoWidgetProvider;-><init>()V

    return-void
.end method

.method private drawWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILjava/lang/String;ILcom/belkin/widgets/WidgetData;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "widgetId"    # I
    .param p4, "name"    # Ljava/lang/String;
    .param p5, "image"    # I
    .param p6, "widgetData"    # Lcom/belkin/widgets/WidgetData;

    .prologue
    .line 145
    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p5

    move-object v3, p4

    move-object v5, p6

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->generateRemoteView(Landroid/content/Context;ILjava/lang/String;ZLcom/belkin/widgets/WidgetData;)Landroid/widget/RemoteViews;

    move-result-object v6

    .line 146
    .local v6, "remoteViews":Landroid/widget/RemoteViews;
    const v0, 0x7f090013

    invoke-virtual {p0, p1, p3}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->generateOnClickIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;

    move-result-object v1

    invoke-virtual {v6, v0, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 147
    invoke-virtual {p2, p3, v6}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 148
    return-void
.end method

.method private handleAutomaticUpdate(Landroid/content/Context;Lcom/belkin/controller/WidgetController;I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p3, "widgetId"    # I

    .prologue
    .line 126
    invoke-static {p1, p3}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v1

    .line 127
    .local v1, "oldData":Lcom/belkin/widgets/WidgetData;
    if-eqz v1, :cond_1

    .line 128
    invoke-static {p2, v1}, Lcom/belkin/widgets/WidgetUtil;->getDeviceInformation(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 129
    .local v0, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 130
    invoke-virtual {p0, p1, p3, v0}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeWidgetView(Landroid/content/Context;ILcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 131
    new-instance v2, Lcom/belkin/widgets/WidgetData;

    invoke-direct {v2, v0}, Lcom/belkin/widgets/WidgetData;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 132
    .local v2, "updatedData":Lcom/belkin/widgets/WidgetData;
    invoke-static {p1, p3, v2}, Lcom/belkin/widgets/WidgetUtil;->storeWidgetData(Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    .line 142
    .end local v0    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "updatedData":Lcom/belkin/widgets/WidgetData;
    :goto_0
    return-void

    .line 134
    .restart local v0    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    sget-object v3, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleAutomaticUpdate - unable to retrieve DeviceInformation from SDK: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v1}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-virtual {v1}, Lcom/belkin/widgets/WidgetData;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, p1, p3, v3}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeUnavailableView(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0

    .line 138
    .end local v0    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    sget-object v3, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "handleAutomaticUpdate - unable to retrieve WidgetData from SharedPreferences: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    const-string v3, ""

    invoke-virtual {p0, p1, p3, v3}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeUnavailableView(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method private handleStateUpdating(Landroid/content/Context;I)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "widgetId"    # I

    .prologue
    .line 43
    invoke-static {p1, p2}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v5

    .line 44
    .local v5, "oldData":Lcom/belkin/widgets/WidgetData;
    if-eqz v5, :cond_0

    .line 45
    const v2, 0x7f020018

    invoke-virtual {v5}, Lcom/belkin/widgets/WidgetData;->getName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->generateRemoteView(Landroid/content/Context;ILjava/lang/String;ZLcom/belkin/widgets/WidgetData;)Landroid/widget/RemoteViews;

    move-result-object v6

    .line 49
    .local v6, "remoteViews":Landroid/widget/RemoteViews;
    const v0, 0x7f090013

    const/4 v1, 0x0

    invoke-virtual {v6, v0, v1}, Landroid/widget/RemoteViews;->setOnClickPendingIntent(ILandroid/app/PendingIntent;)V

    .line 50
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v0

    invoke-virtual {v0, p2, v6}, Landroid/appwidget/AppWidgetManager;->updateAppWidget(ILandroid/widget/RemoteViews;)V

    .line 54
    .end local v6    # "remoteViews":Landroid/widget/RemoteViews;
    :goto_0
    return-void

    .line 52
    :cond_0
    sget-object v0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "handleStateUpdating - unable to retrieve WidgetData from SharedPreferences: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private selectStateImage(II)I
    .locals 3
    .param p1, "state"    # I
    .param p2, "inActive"    # I

    .prologue
    const/4 v2, 0x1

    .line 156
    if-eq p2, v2, :cond_0

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    const/4 v1, 0x4

    if-ne p1, v1, :cond_1

    .line 158
    :cond_0
    const v0, 0x7f020017

    .line 167
    .local v0, "image":I
    :goto_0
    return v0

    .line 160
    .end local v0    # "image":I
    :cond_1
    if-eq p1, v2, :cond_2

    const/16 v1, 0x8

    if-ne p1, v1, :cond_3

    .line 162
    :cond_2
    const v0, 0x7f020016

    .restart local v0    # "image":I
    goto :goto_0

    .line 165
    .end local v0    # "image":I
    :cond_3
    const v0, 0x7f020015

    .restart local v0    # "image":I
    goto :goto_0
.end method

.method private updateDeviceState(Landroid/content/Context;Lcom/belkin/controller/WidgetController;I)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "controller"    # Lcom/belkin/controller/WidgetController;
    .param p3, "widgetId"    # I

    .prologue
    .line 99
    invoke-static {p1, p3}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v0

    .line 100
    .local v0, "oldData":Lcom/belkin/widgets/WidgetData;
    if-eqz v0, :cond_0

    .line 101
    new-instance v1, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;

    invoke-direct {v1, p0, p1, p3, v0}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider$1;-><init>(Lcom/belkin/widgets/WemoOneByOneWidgetProvider;Landroid/content/Context;ILcom/belkin/widgets/WidgetData;)V

    invoke-static {p2, v0, v1}, Lcom/belkin/widgets/WidgetUtil;->getDeviceInformation(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    .line 123
    :goto_0
    return-void

    .line 121
    :cond_0
    const-string v1, ""

    invoke-virtual {p0, p1, p3, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->initializeUnavailableView(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method


# virtual methods
.method protected generateOnClickIntent(Landroid/content/Context;I)Landroid/app/PendingIntent;
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "widgetId"    # I

    .prologue
    .line 184
    invoke-static {p1, p2}, Lcom/belkin/widgets/StateUpdatingIntentService;->getIntent(Landroid/content/Context;I)Landroid/content/Intent;

    move-result-object v0

    .line 185
    .local v0, "intent":Landroid/content/Intent;
    const/high16 v1, 0x8000000

    invoke-static {p1, p2, v0, v1}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

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
    .line 176
    new-instance v0, Landroid/widget/RemoteViews;

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f030006

    invoke-direct {v0, v1, v2}, Landroid/widget/RemoteViews;-><init>(Ljava/lang/String;I)V

    .line 177
    .local v0, "remoteViews":Landroid/widget/RemoteViews;
    const v1, 0x7f090012

    invoke-virtual {v0, v1, p3}, Landroid/widget/RemoteViews;->setTextViewText(ILjava/lang/CharSequence;)V

    .line 178
    const v1, 0x7f090013

    invoke-virtual {v0, v1, p2}, Landroid/widget/RemoteViews;->setImageViewResource(II)V

    .line 179
    const v2, 0x7f090014

    if-eqz p4, :cond_0

    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0, v2, v1}, Landroid/widget/RemoteViews;->setViewVisibility(II)V

    .line 180
    return-object v0

    .line 179
    :cond_0
    const/16 v1, 0x8

    goto :goto_0
.end method

.method protected initializeUnavailableView(Landroid/content/Context;ILjava/lang/String;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "widgetId"    # I
    .param p3, "name"    # Ljava/lang/String;

    .prologue
    .line 171
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v2

    const v5, 0x7f020017

    const/4 v6, 0x0

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    move-object v4, p3

    invoke-direct/range {v0 .. v6}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->drawWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILjava/lang/String;ILcom/belkin/widgets/WidgetData;)V

    .line 172
    return-void
.end method

.method public initializeWidgetView(Landroid/content/Context;ILcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "widgetId"    # I
    .param p3, "info"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 79
    invoke-virtual {p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    .line 81
    .local v4, "textValue":Ljava/lang/String;
    :goto_0
    invoke-virtual {p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v0

    invoke-virtual {p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->selectStateImage(II)I

    move-result v5

    .line 82
    .local v5, "image":I
    invoke-static {p1, p2}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v6

    .line 83
    .local v6, "widgetData":Lcom/belkin/widgets/WidgetData;
    invoke-static {p1}, Landroid/appwidget/AppWidgetManager;->getInstance(Landroid/content/Context;)Landroid/appwidget/AppWidgetManager;

    move-result-object v2

    move-object v0, p0

    move-object v1, p1

    move v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->drawWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILjava/lang/String;ILcom/belkin/widgets/WidgetData;)V

    .line 84
    return-void

    .line 79
    .end local v4    # "textValue":Ljava/lang/String;
    .end local v5    # "image":I
    .end local v6    # "widgetData":Lcom/belkin/widgets/WidgetData;
    :cond_0
    invoke-virtual {p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupName()Ljava/lang/String;

    move-result-object v4

    goto :goto_0
.end method

.method public onDeleted(Landroid/content/Context;[I)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetIds"    # [I

    .prologue
    .line 88
    move-object v0, p2

    .local v0, "arr$":[I
    array-length v3, v0

    .local v3, "len$":I
    const/4 v1, 0x0

    .local v1, "i$":I
    :goto_0
    if-ge v1, v3, :cond_1

    aget v2, v0, v1

    .line 89
    .local v2, "id":I
    invoke-static {p1, v2}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v4

    .line 90
    .local v4, "widgetData":Lcom/belkin/widgets/WidgetData;
    if-eqz v4, :cond_0

    .line 91
    invoke-static {p1, v2}, Lcom/belkin/widgets/WidgetUtil;->removeWidgetData(Landroid/content/Context;I)V

    .line 92
    invoke-virtual {v4}, Lcom/belkin/widgets/WidgetData;->getId()Ljava/lang/String;

    move-result-object v5

    invoke-static {p1, v5, v2}, Lcom/belkin/widgets/WidgetUtil;->removeWidgetIdMapping(Landroid/content/Context;Ljava/lang/String;I)V

    .line 88
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 95
    .end local v2    # "id":I
    .end local v4    # "widgetData":Lcom/belkin/widgets/WidgetData;
    :cond_1
    invoke-super {p0, p1, p2}, Lcom/belkin/widgets/WemoWidgetProvider;->onDeleted(Landroid/content/Context;[I)V

    .line 96
    return-void
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 25
    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 26
    invoke-super {p0, p1, p2}, Lcom/belkin/widgets/WemoWidgetProvider;->onReceive(Landroid/content/Context;Landroid/content/Intent;)V

    .line 27
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    .line 28
    .local v0, "action":Ljava/lang/String;
    const-string v2, "appWidgetId"

    const/4 v3, 0x0

    invoke-virtual {p2, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 29
    .local v1, "widgetId":I
    sget-object v2, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Intent action: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; widget_id: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    if-eqz v1, :cond_0

    .line 31
    const-string v2, "refreshState"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 32
    invoke-static {p1}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    move-result-object v2

    invoke-direct {p0, p1, v2, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->updateDeviceState(Landroid/content/Context;Lcom/belkin/controller/WidgetController;I)V

    .line 40
    .end local v0    # "action":Ljava/lang/String;
    .end local v1    # "widgetId":I
    :cond_0
    :goto_0
    return-void

    .line 33
    .restart local v0    # "action":Ljava/lang/String;
    .restart local v1    # "widgetId":I
    :cond_1
    const-string v2, "stateUpdating"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 34
    invoke-direct {p0, p1, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->handleStateUpdating(Landroid/content/Context;I)V

    goto :goto_0

    .line 35
    :cond_2
    const-string v2, "automaticUpdate"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 36
    invoke-static {p1}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    move-result-object v2

    invoke-direct {p0, p1, v2, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->handleAutomaticUpdate(Landroid/content/Context;Lcom/belkin/controller/WidgetController;I)V

    goto :goto_0
.end method

.method public onUpdate(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;[I)V
    .locals 12
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "appWidgetManager"    # Landroid/appwidget/AppWidgetManager;
    .param p3, "appWidgetIds"    # [I

    .prologue
    .line 58
    array-length v9, p3

    .line 59
    .local v9, "count":I
    sget-object v0, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Number of widget ids: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    move-result-object v8

    .line 62
    .local v8, "controller":Lcom/belkin/controller/WidgetController;
    invoke-virtual {v8, p3}, Lcom/belkin/controller/WidgetController;->addToWidgetIdList([I)V

    .line 63
    invoke-virtual {v8}, Lcom/belkin/controller/WidgetController;->resumeDeviceListManager()V

    .line 64
    invoke-virtual {v8}, Lcom/belkin/controller/WidgetController;->setDeviceListManagerTimeout()V

    .line 68
    move-object v7, p3

    .local v7, "arr$":[I
    array-length v11, v7

    .local v11, "len$":I
    const/4 v10, 0x0

    .local v10, "i$":I
    :goto_0
    if-ge v10, v11, :cond_1

    aget v3, v7, v10

    .line 69
    .local v3, "widgetId":I
    invoke-static {p1, v3}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v6

    .line 70
    .local v6, "widgetData":Lcom/belkin/widgets/WidgetData;
    if-eqz v6, :cond_0

    .line 71
    invoke-virtual {v6}, Lcom/belkin/widgets/WidgetData;->getState()I

    move-result v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->selectStateImage(II)I

    move-result v5

    .line 72
    .local v5, "image":I
    invoke-virtual {v6}, Lcom/belkin/widgets/WidgetData;->getName()Ljava/lang/String;

    move-result-object v4

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-direct/range {v0 .. v6}, Lcom/belkin/widgets/WemoOneByOneWidgetProvider;->drawWidget(Landroid/content/Context;Landroid/appwidget/AppWidgetManager;ILjava/lang/String;ILcom/belkin/widgets/WidgetData;)V

    .line 68
    .end local v5    # "image":I
    :cond_0
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 75
    .end local v3    # "widgetId":I
    .end local v6    # "widgetData":Lcom/belkin/widgets/WidgetData;
    :cond_1
    return-void
.end method
