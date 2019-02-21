.class public Lcom/belkin/widgets/StateUpdatingIntentService;
.super Landroid/app/IntentService;
.source "StateUpdatingIntentService.java"


# static fields
.field private static final HANDLER:Landroid/os/Handler;

.field private static final STATE_CHANGE_TIMEOUT_MS:J = 0x1388L

.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 19
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/belkin/widgets/StateUpdatingIntentService;->HANDLER:Landroid/os/Handler;

    .line 21
    const-class v0, Lcom/belkin/widgets/StateUpdatingIntentService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/widgets/StateUpdatingIntentService;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/belkin/widgets/StateUpdatingIntentService;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/belkin/widgets/StateUpdatingIntentService;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 18
    sget-object v0, Lcom/belkin/widgets/StateUpdatingIntentService;->HANDLER:Landroid/os/Handler;

    return-object v0
.end method

.method public static getIntent(Landroid/content/Context;I)Landroid/content/Intent;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "widgetId"    # I

    .prologue
    .line 24
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/belkin/widgets/StateUpdatingIntentService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 25
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "appWidgetId"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 26
    return-object v0
.end method


# virtual methods
.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 6
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 35
    const-string v3, "appWidgetId"

    const/4 v4, 0x0

    invoke-virtual {p1, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 36
    .local v2, "widgetId":I
    sget-object v3, Lcom/belkin/widgets/StateUpdatingIntentService;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "onHandleIntent - widgetId: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    if-nez v2, :cond_0

    .line 38
    sget-object v3, Lcom/belkin/widgets/StateUpdatingIntentService;->TAG:Ljava/lang/String;

    const-string v4, "Invalid widget id"

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    :goto_0
    return-void

    .line 43
    :cond_0
    const-string v3, "stateUpdating"

    invoke-static {p0, v3, v2}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    .line 45
    invoke-static {p0, v2}, Lcom/belkin/widgets/WidgetUtil;->getWidgetDataFromId(Landroid/content/Context;I)Lcom/belkin/widgets/WidgetData;

    move-result-object v1

    .line 46
    .local v1, "widgetData":Lcom/belkin/widgets/WidgetData;
    if-eqz v1, :cond_1

    .line 48
    invoke-static {p0}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    move-result-object v0

    .line 49
    .local v0, "controller":Lcom/belkin/controller/WidgetController;
    new-instance v3, Lcom/belkin/widgets/StateUpdatingIntentService$1;

    invoke-direct {v3, p0, v1, v0, v2}, Lcom/belkin/widgets/StateUpdatingIntentService$1;-><init>(Lcom/belkin/widgets/StateUpdatingIntentService;Lcom/belkin/widgets/WidgetData;Lcom/belkin/controller/WidgetController;I)V

    invoke-static {v0, v1, v3}, Lcom/belkin/widgets/WidgetUtil;->getDeviceInformation(Lcom/belkin/controller/WidgetController;Lcom/belkin/widgets/WidgetData;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    goto :goto_0

    .line 99
    .end local v0    # "controller":Lcom/belkin/controller/WidgetController;
    :cond_1
    sget-object v3, Lcom/belkin/widgets/StateUpdatingIntentService;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No device info stored for widget: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    const-string v3, "refreshState"

    invoke-static {p0, v3, v2}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_0
.end method
