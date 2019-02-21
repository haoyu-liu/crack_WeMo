.class public Lcom/belkin/controller/WidgetController;
.super Ljava/lang/Object;
.source "WidgetController.java"

# interfaces
.implements Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;


# static fields
.field private static final HANDLER:Landroid/os/Handler;

.field private static final TAG:Ljava/lang/String;

.field private static final TIMEOUT:J = 0x2bf20L

.field private static widgetController:Lcom/belkin/controller/WidgetController;


# instance fields
.field private cacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field private context:Landroid/content/Context;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private setOfWidgetIds:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private stateChangedListeners:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/controller/WidgetStateChangedListener;",
            ">;"
        }
    .end annotation
.end field

.field private widgetUpdateTimeoutRunnable:Lcom/belkin/wemo/runnable/WeMoRunnable;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 26
    const-class v0, Lcom/belkin/controller/WidgetController;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    .line 27
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/belkin/controller/WidgetController;->HANDLER:Landroid/os/Handler;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    new-instance v0, Lcom/belkin/controller/WidgetController$1;

    invoke-direct {v0, p0}, Lcom/belkin/controller/WidgetController$1;-><init>(Lcom/belkin/controller/WidgetController;)V

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->widgetUpdateTimeoutRunnable:Lcom/belkin/wemo/runnable/WeMoRunnable;

    .line 63
    iput-object p1, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    .line 64
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 65
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 66
    invoke-static {p1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 67
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListSet;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->stateChangedListeners:Ljava/util/Set;

    .line 68
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/controller/WidgetController;)Ljava/util/Set;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/WidgetController;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    return-object v0
.end method

.method static synthetic access$002(Lcom/belkin/controller/WidgetController;Ljava/util/Set;)Ljava/util/Set;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/controller/WidgetController;
    .param p1, "x1"    # Ljava/util/Set;

    .prologue
    .line 24
    iput-object p1, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    return-object p1
.end method

.method static synthetic access$100(Lcom/belkin/controller/WidgetController;)Landroid/content/Context;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/WidgetController;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/CacheManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/WidgetController;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/controller/WidgetController;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/controller/WidgetController;

    .prologue
    .line 24
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    return-object v0
.end method

.method static synthetic access$400()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method public static getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    sget-object v0, Lcom/belkin/controller/WidgetController;->widgetController:Lcom/belkin/controller/WidgetController;

    if-nez v0, :cond_0

    .line 57
    new-instance v0, Lcom/belkin/controller/WidgetController;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/controller/WidgetController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/controller/WidgetController;->widgetController:Lcom/belkin/controller/WidgetController;

    .line 59
    :cond_0
    sget-object v0, Lcom/belkin/controller/WidgetController;->widgetController:Lcom/belkin/controller/WidgetController;

    return-object v0
.end method


# virtual methods
.method public addStateChangedListener(Lcom/belkin/controller/WidgetStateChangedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/controller/WidgetStateChangedListener;

    .prologue
    .line 82
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->stateChangedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 83
    return-void
.end method

.method public addToWidgetIdList([I)V
    .locals 2
    .param p1, "widgetIds"    # [I

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 72
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListSet;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    .line 74
    :cond_0
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    invoke-static {p1}, Lcom/belkin/widgets/WidgetUtil;->convertIntArrayToStringList([I)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    .line 75
    return-void
.end method

.method public getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 160
    iget-object v1, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 161
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v0, :cond_0

    .line 163
    iget-object v1, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 165
    :cond_0
    return-object v0
.end method

.method public getDevice(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/controller/WidgetGetDeviceCallback;

    .prologue
    .line 144
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/controller/WidgetController$3;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/controller/WidgetController$3;-><init>(Lcom/belkin/controller/WidgetController;Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 157
    return-void
.end method

.method public getDeviceFromGroup(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;

    .prologue
    .line 138
    iget-object v1, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDevicesInGroup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    .line 139
    .local v0, "devices":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_0

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getDeviceFromGroup(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V
    .locals 2
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "callback"    # Lcom/belkin/controller/WidgetGetDeviceCallback;

    .prologue
    .line 108
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/controller/WidgetController$2;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/controller/WidgetController$2;-><init>(Lcom/belkin/controller/WidgetController;Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 135
    return-void
.end method

.method public getDeviceList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationListFromDB()Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/widgets/WidgetUtil;->generateGroupedDeviceList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 205
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v7, :cond_7

    .line 206
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "onNotify() - event: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; id: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; udn: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; size of DLM\'s DeviceInformation list: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Map;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 208
    const-string v7, "set_state"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 210
    invoke-static {p2}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    .line 211
    .local v4, "success":Z
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->stateChangedListeners:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/belkin/controller/WidgetStateChangedListener;

    .line 212
    .local v3, "stateChangedListener":Lcom/belkin/controller/WidgetStateChangedListener;
    invoke-interface {v3, p3}, Lcom/belkin/controller/WidgetStateChangedListener;->appliesToDevice(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    .line 213
    new-instance v7, Lcom/belkin/controller/WidgetController$4;

    invoke-direct {v7, p0, v3, p3, v4}, Lcom/belkin/controller/WidgetController$4;-><init>(Lcom/belkin/controller/WidgetController;Lcom/belkin/controller/WidgetStateChangedListener;Ljava/lang/String;Z)V

    invoke-virtual {p0, p3, v7}, Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;Lcom/belkin/controller/WidgetGetDeviceCallback;)V

    goto :goto_0

    .line 246
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "stateChangedListener":Lcom/belkin/controller/WidgetStateChangedListener;
    .end local v4    # "success":Z
    :cond_1
    const-string v7, "update"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    const-string v7, "set_widget_state"

    invoke-virtual {p1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_7

    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v7, :cond_7

    .line 247
    :cond_2
    invoke-virtual {p0, p3}, Lcom/belkin/controller/WidgetController;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 248
    .local v1, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v1, :cond_a

    .line 250
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_4

    move-object v0, p3

    .line 252
    .local v0, "deviceId":Ljava/lang/String;
    :goto_1
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    invoke-static {v7, v0}, Lcom/belkin/widgets/WidgetUtil;->getWidgetIdSet(Landroid/content/Context;Ljava/lang/String;)Ljava/util/Set;

    move-result-object v6

    .line 253
    .local v6, "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v6, :cond_9

    .line 254
    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :cond_3
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 255
    .local v5, "widgetId":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    invoke-static {v7, v8}, Lcom/belkin/widgets/WidgetUtil;->getProviderClassForWidget(Landroid/content/Context;I)Ljava/lang/Class;

    move-result-object v7

    if-eqz v7, :cond_3

    .line 257
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    const-string v8, "automaticUpdate"

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v9

    invoke-static {v7, v8, v9}, Lcom/belkin/widgets/WidgetUtil;->sendWidgetBroadcast(Landroid/content/Context;Ljava/lang/String;I)V

    goto :goto_2

    .line 250
    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v5    # "widgetId":Ljava/lang/String;
    .end local v6    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_4
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 260
    .restart local v0    # "deviceId":Ljava/lang/String;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v6    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_5
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    if-eqz v7, :cond_8

    .line 262
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    invoke-interface {v7, v6}, Ljava/util/Set;->removeAll(Ljava/util/Collection;)Z

    .line 263
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UPDATE_DEVICE - setOfWidgetIds size: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget-object v9, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    invoke-interface {v9}, Ljava/util/Set;->size()I

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    iget-object v7, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    invoke-interface {v7}, Ljava/util/Set;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 266
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    const-string v8, "UPDATE_DEVICE - setOfWidgetIds is empty; stopping device list manager"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    sget-object v7, Lcom/belkin/controller/WidgetController;->HANDLER:Landroid/os/Handler;

    iget-object v8, p0, Lcom/belkin/controller/WidgetController;->widgetUpdateTimeoutRunnable:Lcom/belkin/wemo/runnable/WeMoRunnable;

    invoke-virtual {v7, v8}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 268
    invoke-static {}, Lcom/belkin/wemo/cache/utils/WemoUtils;->isAppInForeground()Z

    move-result v7

    if-nez v7, :cond_6

    .line 269
    invoke-virtual {p0}, Lcom/belkin/controller/WidgetController;->pauseDeviceListManager()V

    .line 271
    :cond_6
    const/4 v7, 0x0

    iput-object v7, p0, Lcom/belkin/controller/WidgetController;->setOfWidgetIds:Ljava/util/Set;

    .line 284
    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v6    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_7
    :goto_3
    return-void

    .line 274
    .restart local v0    # "deviceId":Ljava/lang/String;
    .restart local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v6    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_8
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    const-string v8, "UPDATE_DEVICE - set of widget ids that need updating doesn\'t exist"

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 277
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_9
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UPDATE_DEVICE - No widget ids found for device or group with udn/groupId: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    .line 280
    .end local v0    # "deviceId":Ljava/lang/String;
    .end local v6    # "widgetIds":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_a
    sget-object v7, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "UPDATE_DEVICE - No device found with udn: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3
.end method

.method public pauseDeviceListManager()V
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onPause()V

    .line 100
    :cond_0
    return-void
.end method

.method public removeStateChangedListener(Lcom/belkin/controller/WidgetStateChangedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/controller/WidgetStateChangedListener;

    .prologue
    .line 86
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->stateChangedListeners:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 87
    return-void
.end method

.method public resumeDeviceListManager()V
    .locals 1

    .prologue
    .line 90
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 91
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 94
    return-void
.end method

.method public setDeviceListManagerTimeout()V
    .locals 4

    .prologue
    .line 78
    sget-object v0, Lcom/belkin/controller/WidgetController;->HANDLER:Landroid/os/Handler;

    iget-object v1, p0, Lcom/belkin/controller/WidgetController;->widgetUpdateTimeoutRunnable:Lcom/belkin/wemo/runnable/WeMoRunnable;

    const-wide/32 v2, 0x2bf20

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 79
    return-void
.end method

.method public setDeviceState(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "state"    # I
    .param p3, "type"    # Ljava/lang/String;
    .param p4, "capabilities"    # Ljava/lang/String;

    .prologue
    .line 169
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    .line 171
    .local v2, "jsonObj":Lorg/json/JSONObject;
    :try_start_0
    iget-object v3, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 173
    const-string v3, "onOff"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 174
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 175
    .local v1, "jsonCapabilities":Lorg/json/JSONObject;
    const/4 v3, 0x1

    if-ne p2, v3, :cond_0

    if-eqz v1, :cond_0

    const-string v3, "levelControl"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 176
    const-string v3, "levelControl"

    const-string v4, "levelControl"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 189
    .end local v1    # "jsonCapabilities":Lorg/json/JSONObject;
    :cond_0
    :goto_0
    iget-object v3, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v3, p1, v2, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 190
    :goto_1
    return-void

    .line 178
    :cond_1
    :try_start_1
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/IsDevice;->NonSmartMaker(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 180
    const-string v3, "switch"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    .line 185
    :catch_0
    move-exception v0

    .line 186
    .local v0, "e":Lorg/json/JSONException;
    sget-object v3, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    const-string v4, "setDeviceState - JSONException while trying build the attributes JSONObject: "

    invoke-static {v3, v4, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1

    .line 183
    .end local v0    # "e":Lorg/json/JSONException;
    :cond_2
    :try_start_2
    const-string v3, "binaryState"

    invoke-virtual {v2, v3, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0
.end method

.method public setGroupState(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 4
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "bridgeUdn"    # Ljava/lang/String;
    .param p3, "state"    # I

    .prologue
    .line 193
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 195
    .local v1, "jsonObj":Lorg/json/JSONObject;
    :try_start_0
    const-string v2, "onOff"

    invoke-virtual {v1, v2, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 200
    iget-object v2, p0, Lcom/belkin/controller/WidgetController;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p1, v1, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setGroupState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V

    .line 201
    :goto_0
    return-void

    .line 196
    :catch_0
    move-exception v0

    .line 197
    .local v0, "e":Lorg/json/JSONException;
    sget-object v2, Lcom/belkin/controller/WidgetController;->TAG:Ljava/lang/String;

    const-string v3, "setGroupState - JSONException while trying build the attributes JSONObject: "

    invoke-static {v2, v3, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method
