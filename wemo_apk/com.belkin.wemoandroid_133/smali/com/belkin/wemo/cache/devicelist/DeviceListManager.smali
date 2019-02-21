.class public Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
.super Ljava/lang/Object;
.source "DeviceListManager.java"

# interfaces
.implements Lorg/cybergarage/upnp/device/DeviceChangeListener;
.implements Lorg/cybergarage/upnp/event/EventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;,
        Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;,
        Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    }
.end annotation


# static fields
.field public static final ADD_DEVICE:Ljava/lang/String; = "add"

.field private static final AFTER_RESUME_UNICAST_DELAY:J = 0x5L

.field public static final AVAILABLE_FW_UPDATES:Ljava/lang/String; = "available_fw_updates"

.field public static final BULB_FW_UPDATE:Ljava/lang/String; = "SubDeviceFWUpdate"

.field public static final CHANGE_ATTRIBUTE:Ljava/lang/String; = "change_attribute"

.field public static final CHANGE_STATE:Ljava/lang/String; = "change_state"

.field public static final CHANGE_STATE_IN_REMOTE_FAILED:Ljava/lang/String; = "change_state_in_remote_failed"

.field public static final GET_BLOB_STORAGE:Ljava/lang/String; = "get_blob_storage"

.field public static final HIDE_DEVICE:Ljava/lang/String; = "hide"

.field public static final LOCATION_CREATION_FAILED:Ljava/lang/String; = "location_creation_failed"

.field public static final LOCATION_CREATION_SUCCESS:Ljava/lang/String; = "location_creation_success"

.field public static final MSEARCH_CONCURRENT_INTERVAL:I = 0x64

.field public static final MSEARCH_EXISTING_DEVICE_INTERVAL:I = 0x3a98

.field public static final MSEARCH_INTERVAL:I = 0xbb8

.field public static final MSEARCH_ITERATION:I = 0x3

.field public static final NEST_AUTH_TOKEN_EXISTENCE:Ljava/lang/String; = "nest_auth_token_existence"

.field public static final NEST_DEAUTH0RIZATION_RESPONSE:Ljava/lang/String; = "nest_deauthorization_response"

.field public static final NEST_DEAUTHORIZED:Ljava/lang/String; = "nest_deauthorized"

.field public static final PLUGIN_CONNECTED:Ljava/lang/String; = "pluginConnected"

.field private static final REFRESH_DELAY:J = 0xea60L

.field public static final REFRESH_LIST:Ljava/lang/String; = "refresh"

.field public static final REFRESH_LIST_COMPLETED:Ljava/lang/String; = "refreshListCompleted"

.field public static final REMOVE_DEVICE:Ljava/lang/String; = "remove"

.field public static final RESET_ALL:Ljava/lang/String; = "reset_all"

.field public static final RESET_CACHE:Ljava/lang/String; = "reset_cache"

.field public static final RESET_FN_ICON_RULES:Ljava/lang/String; = "reset_fn_icon_rules"

.field public static final RESET_USAGE_DATA:Ljava/lang/String; = "reset_usage_data"

.field public static final RESET_WIFI:Ljava/lang/String; = "reset_wifi"

.field public static final SET_ATTRIBUTE:Ljava/lang/String; = "set_attribute"

.field public static final SET_BLOB_STORAGE:Ljava/lang/String; = "set_blob_storage"

.field public static final SET_NEST_ERROR_CODE:Ljava/lang/String; = "set_nest_error_code"

.field public static final SET_PROPERTIES:Ljava/lang/String; = "set_properties"

.field public static final SET_REMOTE:Ljava/lang/String; = "set_remote"

.field public static final SET_STATE:Ljava/lang/String; = "set_state"

.field public static final STATE_CHANGED_IN_REMOTE:Ljava/lang/String; = "state_changed"

.field private static final TAG:Ljava/lang/String; = "DeviceListManager"

.field public static final THERE_ARE_NOT_REMOTE_DEVICES:Ljava/lang/String; = "there_are_not_remote_devices"

.field public static final THERE_ARE_REMOTE_DEVICES:Ljava/lang/String; = "there_are_remote_devices"

.field public static final UPDATE_DEVICE:Ljava/lang/String; = "update"

.field public static final UPDATE_FIRMWARE:Ljava/lang/String; = "update_firmware"

.field public static final UPDATE_GROUP_STATE:Ljava/lang/String; = "update_group_state"

.field public static final UPDATE_WIDGET:Ljava/lang/String; = "set_widget_state"

.field public static final ZIGBEE_STATUS_DONE:Ljava/lang/String; = "zigbee_status_done"

.field private static cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

.field private static cacheManager:Lcom/belkin/wemo/cache/CacheManager;

.field public static capabalityProfileList:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static capabilityIDToTagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public static context:Landroid/content/Context;

.field public static devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field public static firstRemoteCall:Z

.field private static iconsDir:Ljava/lang/String;

.field public static mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

.field private static packageName:Ljava/lang/String;


# instance fields
.field private final MSEARCH_COUNT:I

.field private final MSEARCH_DELAY:I

.field private binaryStateRequestTrackerMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;",
            ">;"
        }
    .end annotation
.end field

.field private checkIfServiceFilesReload:Z

.field private currentSSID:Ljava/lang/String;

.field private deviceNotReachable:Z

.field private devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

.field private devicesStartTimes:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation
.end field

.field private emailSubscriptionOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;

.field private fwUpdateInProgressDataMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;",
            ">;"
        }
    .end annotation
.end field

.field private isNotificationComes:Z

.field private lastModeLocal:Z

.field private lastSSID:Ljava/lang/String;

.field private ledIconOnRemoteAccessListener:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

.field private listenersSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;",
            ">;"
        }
    .end annotation
.end field

.field private mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

.field private mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

.field private mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

.field private mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field public mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

.field private msearchInProgressDeviceList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mutex:Ljava/lang/Object;

.field private networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

.field private offlineLEDCount:I

.field private remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

.field private serviceFilesSynched:Z

.field private smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

.field private startDiscoveryTimeForRemote:J

.field private startTime:J

.field private updateTimer:Ljava/util/Timer;

.field private worker:Ljava/util/concurrent/ScheduledExecutorService;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 336
    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 340
    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 341
    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    .line 373
    const/4 v0, 0x1

    sput-boolean v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    .line 381
    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    .line 382
    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 5
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    const/4 v2, 0x0

    .line 408
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 239
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceNotReachable:Z

    .line 344
    const/4 v1, 0x3

    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->MSEARCH_COUNT:I

    .line 345
    const/16 v1, 0x7d0

    iput v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->MSEARCH_DELAY:I

    .line 348
    iput-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 349
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    .line 350
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->serviceFilesSynched:Z

    .line 351
    iput-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    .line 352
    new-instance v1, Ljava/lang/Object;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    .line 361
    iput-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    .line 365
    iput-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    .line 374
    const-wide/16 v2, 0x0

    iput-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    .line 375
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    .line 409
    new-instance v1, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->msearchInProgressDeviceList:Ljava/util/List;

    .line 410
    sput-object p1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    .line 411
    new-instance v1, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 412
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 414
    .local v0, "networkType":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "DeviceListManager Constructor hash: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ;Network Type : "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 417
    invoke-static {p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    .line 418
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    .line 419
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 420
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 421
    new-instance v1, Ljava/util/concurrent/ConcurrentSkipListSet;

    new-instance v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$1;

    invoke-direct {v2, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$1;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v1, v2}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>(Ljava/util/Comparator;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    .line 430
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    .line 432
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->loadProductNameMapping()Ljava/util/HashMap;

    .line 433
    invoke-static {}, Lcom/belkin/wemo/cache/data/DevicesArray;->loadProductTypeMapping()Ljava/util/HashMap;

    .line 434
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    .line 435
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    .line 437
    new-instance v1, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2, v3}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    .line 439
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->packageName:Ljava/lang/String;

    .line 440
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->iconsDir:Ljava/lang/String;

    .line 441
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    .line 442
    new-instance v1, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mMoreUtil:Lcom/belkin/wemo/cache/utils/MoreUtil;

    .line 444
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->binaryStateRequestTrackerMap:Ljava/util/Map;

    .line 446
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    .line 447
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    .line 449
    new-instance v2, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const-string v4, "connectivity"

    invoke-virtual {v1, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/net/ConnectivityManager;

    invoke-direct {v2, v3, v1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;-><init>(Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Landroid/net/ConnectivityManager;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    .line 450
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->startListening(Landroid/content/Context;)V

    .line 452
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 455
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/cache/utils/WemoUtils;->readFirmwareUpgradeInProgressState(Landroid/content/Context;)Ljava/util/Map;

    move-result-object v1

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    .line 457
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    if-nez v1, :cond_0

    .line 458
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    .line 461
    :cond_0
    const-string v1, "DeviceListManager"

    const-string v2, "FW Update: fwUpdateInProgressDataMap reading from Internal Memory"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 462
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 463
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/cloud/SmartDiscovery;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 189
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lorg/cybergarage/upnp/ControlPoint;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/data/DevicesArray;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    return-object v0
.end method

.method static synthetic access$400()Lcom/belkin/wemo/cache/CacheManager;
    .locals 1

    .prologue
    .line 189
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    return-object v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 189
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->msearchInProgressDeviceList:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$600(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->scanZigBeeBridge(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$700(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/Map;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p1, "x1"    # Ljava/util/Map;

    .prologue
    .line 189
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeOfflineGroupLeds(Ljava/util/Map;)V

    return-void
.end method

.method static synthetic access$800(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 189
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addOrUpdateZBDevice(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V

    return-void
.end method

.method private addDiscoveryTry(Ljava/lang/String;JZ)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "time"    # J
    .param p4, "success"    # Z

    .prologue
    .line 1948
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceDiscovered(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1949
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, p4, p1, p2, p3}, Lcom/belkin/wemo/cache/CacheManager;->addDiscoveryTry(ZLjava/lang/String;J)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 1954
    :cond_0
    :goto_0
    return-void

    .line 1951
    :catch_0
    move-exception v0

    .line 1952
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method private declared-synchronized addOrUpdateZBDevice(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V
    .locals 8
    .param p1, "bridgeUdn"    # Ljava/lang/String;
    .param p2, "zbDevInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "discoveryStatus"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    .line 2486
    monitor-enter p0

    :try_start_0
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v2

    .line 2487
    .local v2, "inActive":I
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v1

    .line 2488
    .local v1, "groupID":Ljava/lang/String;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->isDeviceInDB(Ljava/lang/String;)Z

    move-result v3

    .line 2489
    .local v3, "isDeviceInDB":Z
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: addOrUpdateZBDevice: device ID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Is Device in DB: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; InActive: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Group ID: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; icon: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; groupIcon: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupIcon()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2498
    if-nez v3, :cond_0

    if-ne v2, v7, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 2499
    :cond_0
    if-eq v2, v7, :cond_1

    .line 2500
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 2501
    const/4 v4, 0x1

    invoke-virtual {p2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 2502
    const/4 v4, 0x0

    invoke-virtual {p2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 2505
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    .line 2506
    .local v0, "deviceInfoList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v0, :cond_4

    .line 2507
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 2508
    sget-object v4, Lcom/belkin/wemo/cache/data/DevicesArray;->productNameMapping:Ljava/util/HashMap;

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductName(Ljava/lang/String;)V

    .line 2511
    :cond_2
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getProductType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 2512
    sget-object v4, Lcom/belkin/wemo/cache/data/DevicesArray;->productTypeMapping:Ljava/util/HashMap;

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-static {v4}, Lcom/belkin/wemo/cache/utils/StringUtils;->toLowerCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setProductType(Ljava/lang/String;)V

    .line 2515
    :cond_3
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceInformationList(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 2519
    .end local v0    # "deviceInfoList":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :cond_4
    if-eqz v3, :cond_6

    .line 2520
    const-string v4, "ZigbeeScan"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: UPDATING LED device in cache DB:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2521
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-virtual {v4, p2, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 2522
    const-string v4, "ZigbeeScan"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: going to send UPDATE NOTIFICATION"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2523
    const-string v4, "update"

    const-string v5, ""

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2531
    :cond_5
    :goto_0
    monitor-exit p0

    return-void

    .line 2525
    :cond_6
    if-ne v2, v7, :cond_7

    :try_start_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_5

    .line 2526
    :cond_7
    const-string v4, "ZigbeeScan"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: ADDING NEW LED device in cache DB:"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2527
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x1

    const/4 v6, 0x1

    const/4 v7, 0x1

    invoke-virtual {v4, p2, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 2528
    const-string v4, "ZigbeeScan"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery Zigbee: going to send ADD NOTIFICATION"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2529
    const-string v4, "add"

    const-string v5, ""

    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 2486
    .end local v1    # "groupID":Ljava/lang/String;
    .end local v2    # "inActive":I
    .end local v3    # "isDeviceInDB":Z
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4
.end method

.method private checkIfServiceFilesReload(Lorg/cybergarage/upnp/Device;[Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "deviceInformation"    # [Ljava/lang/String;
    .param p3, "serialNumber"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 3804
    const/4 v0, 0x0

    .line 3805
    .local v0, "cachedFWVersion":Ljava/lang/String;
    const/4 v1, 0x0

    .line 3807
    .local v1, "currentFWVersion":Ljava/lang/String;
    :try_start_0
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v3, :cond_0

    .line 3855
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    .line 3858
    :goto_0
    return-void

    .line 3809
    :cond_0
    const/4 v3, 0x1

    :try_start_1
    iput-boolean v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    .line 3810
    if-eqz p2, :cond_4

    .line 3811
    const/4 v3, 0x1

    aget-object v1, p2, v3

    .line 3812
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v0

    .line 3813
    const-string v3, "WeMoSDK"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checkIfServiceFilesReload cache:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " current: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " sno: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mutex: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3817
    if-eqz v0, :cond_1

    if-eqz v1, :cond_1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    move-result v3

    if-eqz v3, :cond_2

    .line 3855
    :cond_1
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    goto :goto_0

    .line 3822
    :cond_2
    :try_start_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    monitor-enter v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 3823
    :try_start_3
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v0

    .line 3832
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 3834
    invoke-direct {p0, p1, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V

    .line 3837
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 3847
    :goto_1
    :try_start_4
    const-string v3, "WeMoSDK"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checkIfServiceFilesReload RELOADED cache:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " current: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " mutex: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->serviceFilesSynched:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 3855
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 3836
    :cond_3
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 3855
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 3837
    :catchall_0
    move-exception v3

    :try_start_6
    monitor-exit v4
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    :try_start_7
    throw v3
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 3851
    :catch_0
    move-exception v2

    .line 3852
    .local v2, "e":Ljava/lang/Exception;
    :try_start_8
    const-string v3, "WeMoSDK"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "checkIfServiceFilesReload serialNumber:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " Exception e: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 3855
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 3840
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_4
    :try_start_9
    iget-boolean v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->serviceFilesSynched:Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-eqz v3, :cond_5

    .line 3855
    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 3842
    :cond_5
    :try_start_a
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    monitor-enter v4
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 3843
    :try_start_b
    invoke-direct {p0, p1, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V

    .line 3844
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->serviceFilesSynched:Z

    .line 3845
    monitor-exit v4

    goto/16 :goto_1

    :catchall_1
    move-exception v3

    monitor-exit v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :try_start_c
    throw v3
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_0
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 3855
    :catchall_2
    move-exception v3

    iput-boolean v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->checkIfServiceFilesReload:Z

    throw v3
.end method

.method private createAttributeList(Lorg/json/JSONObject;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 8
    .param p1, "attributes"    # Lorg/json/JSONObject;
    .param p2, "wemDevice"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 4533
    const/4 v5, 0x4

    new-array v0, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "Switch"

    aput-object v6, v0, v5

    const/4 v5, 0x1

    const-string v6, "Sensor"

    aput-object v6, v0, v5

    const/4 v5, 0x2

    const-string v6, "SwitchMode"

    aput-object v6, v0, v5

    const/4 v5, 0x3

    const-string v6, "SensorPresent"

    aput-object v6, v0, v5

    .line 4534
    .local v0, "arr":[Ljava/lang/String;
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 4536
    .local v4, "str":Ljava/lang/StringBuffer;
    const/4 v2, 0x0

    .local v2, "count":I
    :goto_0
    :try_start_0
    array-length v5, v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    if-ge v2, v5, :cond_0

    .line 4537
    const/4 v1, 0x0

    .line 4539
    .local v1, "attributevalue":Ljava/lang/String;
    :try_start_1
    aget-object v5, v0, v2

    invoke-virtual {p1, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    .line 4543
    :goto_1
    :try_start_2
    const-string v5, "<attribute>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4544
    const-string v5, "<name>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4545
    aget-object v5, v0, v2

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4546
    const-string v5, "</name>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4547
    const-string v5, "<value>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4548
    invoke-virtual {v4, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4549
    const-string v5, "</value>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4550
    const-string v5, "</attribute>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4536
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 4540
    :catch_0
    move-exception v3

    .line 4541
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 4552
    .end local v1    # "attributevalue":Ljava/lang/String;
    .end local v3    # "e":Ljava/lang/Exception;
    :catch_1
    move-exception v3

    .line 4554
    .restart local v3    # "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    .line 4556
    .end local v3    # "e":Ljava/lang/Exception;
    :cond_0
    const-string v5, "DeviceListManager.createAttributeList"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "str.toString():::::::;"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4558
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method public static getCapabilityIDFromTag(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "tag"    # Ljava/lang/String;

    .prologue
    .line 6979
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 6980
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    .line 6982
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "onOff"

    const-string v2, "10006"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6983
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "levelControl"

    const-string v2, "10008"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6984
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "sleepFader"

    const-string v2, "30008"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6985
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "levelControlMove"

    const-string v2, "30009"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6986
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "levelControlStop"

    const-string v2, "3000A"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6987
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "identify"

    const-string v2, "10003"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6988
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "colorControl"

    const-string v2, "10300"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6989
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "colorTemperature"

    const-string v2, "30301"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6990
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "iasZone"

    const-string v2, "10500"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6991
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "sensorConfig"

    const-string v2, "20500"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6992
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "sensorTestMode"

    const-string v2, "30501"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6993
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    const-string v1, "sensorKeyPress"

    const-string v2, "20502"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6996
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabilityIDToTagMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method private getDefaultLocation()Lcom/belkin/wemo/cache/location/Location;
    .locals 6

    .prologue
    .line 6941
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getRemoteAccessDet()Lorg/json/JSONArray;

    move-result-object v0

    .line 6942
    .local v0, "arry":Lorg/json/JSONArray;
    const/4 v2, 0x0

    .line 6943
    .local v2, "location":Lcom/belkin/wemo/cache/location/Location;
    if-eqz v0, :cond_0

    .line 6946
    :try_start_0
    new-instance v3, Lcom/belkin/wemo/cache/location/Location;

    const/4 v4, 0x2

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {v0, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Lcom/belkin/wemo/cache/location/Location;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6947
    .end local v2    # "location":Lcom/belkin/wemo/cache/location/Location;
    .local v3, "location":Lcom/belkin/wemo/cache/location/Location;
    :try_start_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getARPMacs()Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/location/Location;->setArpMacs(Ljava/util/Set;)V

    .line 6948
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getHomeSSIDs()Ljava/util/Set;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/location/Location;->setSsids(Ljava/util/Set;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    move-object v2, v3

    .line 6954
    .end local v3    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v2    # "location":Lcom/belkin/wemo/cache/location/Location;
    :cond_0
    :goto_0
    return-object v2

    .line 6950
    :catch_0
    move-exception v1

    .line 6951
    .local v1, "e":Ljava/lang/Exception;
    :goto_1
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    .line 6950
    .end local v1    # "e":Ljava/lang/Exception;
    .end local v2    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v3    # "location":Lcom/belkin/wemo/cache/location/Location;
    :catch_1
    move-exception v1

    move-object v2, v3

    .end local v3    # "location":Lcom/belkin/wemo/cache/location/Location;
    .restart local v2    # "location":Lcom/belkin/wemo/cache/location/Location;
    goto :goto_1
.end method

.method private getDeviceFromList(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;Ljava/util/ArrayList;ZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 6
    .param p1, "wemoDevice"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;
    .param p3, "forLocalCache"    # Z
    .param p4, "forDevicesCache"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/devicelist/WeMoDevice;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;ZZ)",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;"
        }
    .end annotation

    .prologue
    .line 2772
    .local p2, "devList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v1, 0x0

    .line 2774
    .local v1, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :try_start_0
    invoke-virtual {p2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2775
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2776
    if-eqz p3, :cond_2

    .line 2777
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoObjectForLocalCache(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 2781
    :cond_1
    :goto_1
    if-eqz v1, :cond_0

    .line 2782
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v4

    invoke-virtual {v1, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2786
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v2

    .line 2787
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 2788
    const/4 v4, 0x0

    .line 2790
    .end local v2    # "e":Ljava/lang/Exception;
    :goto_2
    return-object v4

    .line 2778
    .restart local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    if-eqz p4, :cond_1

    .line 2779
    :try_start_1
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoObjectForDevicesCache(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v1

    goto :goto_1

    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    move-object v4, v1

    .line 2790
    goto :goto_2
.end method

.method private getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 1943
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method private getDeviceInfoObjectForDevicesCache(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 18
    .param p1, "dev"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 2839
    const/4 v7, 0x0

    .line 2840
    .local v7, "state":I
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2841
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getState()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 2844
    :cond_0
    const-string v15, ""

    .line 2845
    .local v15, "lastSeen":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    if-eqz v3, :cond_1

    .line 2846
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getTimeStamp()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v15

    .line 2848
    :cond_1
    new-instance v2, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v6

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getAttributeList()Ljava/lang/String;

    move-result-object v8

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getInActive()I

    move-result v9

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getModelName()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getCustomizedState()Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoParameter(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "0"

    const/16 v16, 0x0

    invoke-direct/range {v2 .. v16}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2858
    .end local v15    # "lastSeen":Ljava/lang/String;
    :goto_0
    return-object v2

    .line 2855
    :catch_0
    move-exception v17

    .line 2856
    .local v17, "e":Ljava/lang/Exception;
    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->printStackTrace()V

    .line 2858
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private getDeviceInfoObjectForLocalCache(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 4
    .param p1, "dev"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 2826
    const-string v1, ""

    .line 2827
    .local v1, "ip":Ljava/lang/String;
    const/4 v2, 0x0

    .line 2828
    .local v2, "port":I
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 2829
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 2830
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v2

    .line 2832
    :cond_0
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v3, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 2833
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    return-object v0
.end method

.method private getDeviceInfoParameter(Lorg/cybergarage/upnp/Device;)Ljava/lang/String;
    .locals 6
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 2862
    const-string v0, ""

    .line 2863
    .local v0, "devInfo":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 2864
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v1

    .line 2865
    .local v1, "deviceInfo":[Ljava/lang/String;
    if-eqz v1, :cond_0

    array-length v4, v1

    if-lez v4, :cond_0

    .line 2866
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 2868
    .local v3, "obj":Lorg/json/JSONObject;
    :try_start_0
    const-string v4, "macAddress"

    const/4 v5, 0x0

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2869
    const-string v4, "FWVersion"

    const/4 v5, 0x1

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2870
    const-string v4, "iconVersion"

    const/4 v5, 0x2

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2871
    const-string v4, "iconPort"

    const/4 v5, 0x3

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2872
    const-string v4, "binaryState"

    const/4 v5, 0x4

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 2873
    const-string v4, "friendlyName"

    const/4 v5, 0x5

    aget-object v5, v1, v5

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2877
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    .line 2880
    .end local v1    # "deviceInfo":[Ljava/lang/String;
    .end local v3    # "obj":Lorg/json/JSONObject;
    :cond_0
    return-object v0

    .line 2874
    .restart local v1    # "deviceInfo":[Ljava/lang/String;
    .restart local v3    # "obj":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 2875
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method public static getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 696
    const-string v0, ":switch:sensor"

    const-string v1, ":sensor:switch"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 697
    return-object p0
.end method

.method public static getIPForDevice(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 729
    const-string v1, ""

    .line 730
    .local v1, "result":Ljava/lang/String;
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v2, :cond_0

    .line 731
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 732
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 733
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 734
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v1

    .line 738
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return-object v1
.end method

.method public static getIconsDir()Ljava/lang/String;
    .locals 1

    .prologue
    .line 720
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->iconsDir:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 721
    const-string v0, ""

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->iconsDir:Ljava/lang/String;

    .line 723
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->iconsDir:Ljava/lang/String;

    return-object v0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 689
    const-class v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 690
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 692
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 689
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getInstance(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .locals 2
    .param p0, "act"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 681
    const-class v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    monitor-enter v1

    :try_start_0
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 682
    if-eqz p0, :cond_0

    .line 683
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setCallbackListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V

    .line 685
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 681
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static getPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 712
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->packageName:Ljava/lang/String;

    if-nez v0, :cond_0

    .line 713
    const-string v0, ""

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->packageName:Ljava/lang/String;

    .line 715
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->packageName:Ljava/lang/String;

    return-object v0
.end method

.method public static getPortForDevice(Ljava/lang/String;)I
    .locals 3
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 742
    const/4 v1, 0x0

    .line 743
    .local v1, "result":I
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v2, :cond_0

    .line 744
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v2, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 745
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 746
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 747
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v1

    .line 751
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return v1
.end method

.method private getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;
    .locals 6

    .prologue
    .line 399
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    monitor-enter v1

    .line 400
    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    if-nez v0, :cond_0

    .line 401
    new-instance v0, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-direct {v0, p0, v2, v3, v4}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Lcom/belkin/wemo/cache/cloud/CloudRequestManager;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .line 404
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->smartDiscovery:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    monitor-exit v1

    return-object v0

    .line 405
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method private isCandidateForMSearchProcessing(Lorg/cybergarage/upnp/Device;)Z
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 1957
    const-string v4, "DeviceListManager"

    const-string v5, "FW Update: fwUpdateInProgressDataMap: isCandidateForMSearchProcessing."

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1958
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 1960
    const/4 v0, 0x0

    .line 1962
    .local v0, "isCandidate":Z
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_3

    .line 1963
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    .line 1964
    .local v3, "udn":Ljava/lang/String;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getIPAddress()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getPort()I

    move-result v6

    invoke-virtual {v4, v3, v5, v6}, Lcom/belkin/wemo/cache/CacheManager;->isCandidateForMSearch(Ljava/lang/String;Ljava/lang/String;I)Z

    move-result v1

    .line 1965
    .local v1, "isCandidateForMSearchViaDB":Z
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v2

    .line 1966
    .local v2, "isDeviceInUpdateMode":Z
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery: MSearch Device: isCandidateForMSearchProcessing: UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; isCandidateForMSearchViaDB: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, ";  isDeviceInUpdateMode: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1968
    if-nez v1, :cond_0

    if-eqz v2, :cond_1

    .line 1969
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v4

    if-nez v4, :cond_2

    .line 1970
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery: MSearch Device is not directly connected to APP: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1971
    const/4 v0, 0x1

    .line 1982
    .end local v1    # "isCandidateForMSearchViaDB":Z
    .end local v2    # "isDeviceInUpdateMode":Z
    .end local v3    # "udn":Ljava/lang/String;
    :cond_1
    :goto_0
    return v0

    .line 1973
    .restart local v1    # "isCandidateForMSearchViaDB":Z
    .restart local v2    # "isDeviceInUpdateMode":Z
    .restart local v3    # "udn":Ljava/lang/String;
    :cond_2
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Discovery: MSearch Device is DIRECTLY connected to APP: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1978
    .end local v1    # "isCandidateForMSearchViaDB":Z
    .end local v2    # "isDeviceInUpdateMode":Z
    .end local v3    # "udn":Ljava/lang/String;
    :cond_3
    const-string v4, "DeviceListManager"

    const-string v5, "Network Mode is REMOTE thus MSearch Device is NOT a candidate for processing."

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1979
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isLocalMode()Z
    .locals 2

    .prologue
    .line 701
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 702
    .local v0, "networkUtils":Ljava/lang/String;
    const-string v1, "Remote_Mobile"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "Remote_WiFi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 704
    :cond_0
    const/4 v1, 0x0

    .line 706
    :goto_0
    return v1

    :cond_1
    const/4 v1, 0x1

    goto :goto_0
.end method

.method private needUpdateDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 5
    .param p1, "newDevice"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 4627
    if-eqz p1, :cond_b

    .line 4628
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v3, v2, v2, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4630
    .local v0, "oldDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v0, :cond_1

    .line 4669
    .end local v0    # "oldDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    :goto_0
    return v1

    .line 4632
    .restart local v0    # "oldDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_2
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_3
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_4
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v3

    if-eqz v3, :cond_5

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_5
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_6

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_6
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCustomizedState()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_7

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCustomizedState()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCustomizedState()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCustomizedState()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_7
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_8

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_8

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_8
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_9

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_9

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInfo()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_9
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getLastSeen()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_a

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getLastSeen()Ljava/lang/String;

    move-result-object v3

    const-string v4, ""

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_a

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getLastSeen()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getLastSeen()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_a
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v4

    if-ne v3, v4, :cond_0

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getHide()I

    move-result v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getHide()I

    move-result v4

    if-ne v3, v4, :cond_0

    .end local v0    # "oldDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_b
    move v1, v2

    .line 4669
    goto/16 :goto_0
.end method

.method private onBridgeNotDiscovered(Ljava/lang/String;)V
    .locals 11
    .param p1, "bridgeUdn"    # Ljava/lang/String;

    .prologue
    const/4 v10, 0x0

    const/4 v9, 0x1

    .line 2718
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unicast Discovery: Bridge not discovered. Thus, updating all Zigbee devices. Bridge UDN: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2719
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v6, p1}, Lcom/belkin/wemo/cache/CacheManager;->getInitialZigbeeDevicesList(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 2721
    .local v5, "zigbeeDeviceList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 2722
    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 2723
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2724
    .local v4, "zigbeeDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    .line 2725
    .local v3, "udn":Ljava/lang/String;
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Unicast Discovery: Bridge not discovered. Updating Zigbee Device: UDN"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2727
    invoke-virtual {v4, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 2728
    invoke-virtual {v4, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 2729
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v6, v3, v10}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 2730
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v6, v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 2732
    const-string v6, "update"

    const-string v7, ""

    invoke-virtual {p0, v6, v7, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2734
    const-string v6, "Discovery TimeOut"

    invoke-direct {p0, v3, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 2739
    .end local v3    # "udn":Ljava/lang/String;
    .end local v4    # "zigbeeDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2740
    .restart local v4    # "zigbeeDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v6, v4, v9, v9, v9}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto :goto_1

    .line 2743
    .end local v4    # "zigbeeDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 2745
    new-instance v2, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 2746
    .local v2, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v6, "cache.db"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v2, v6, v7}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 2748
    .end local v2    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_2
    return-void
.end method

.method private removeOfflineGroupLeds(Ljava/util/Map;)V
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 2306
    .local p1, "zigBeeDevicesMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 2307
    .local v4, "groupMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v12

    invoke-direct {v9, v12}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 2310
    .local v9, "ledList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .local v5, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2311
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInActive()I

    move-result v6

    .line 2312
    .local v6, "inActive":I
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v3

    .line 2313
    .local v3, "groupID":Ljava/lang/String;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Separating out ONLINE and OFFLINE Groups. Device UDN: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; GroupID: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; InActive: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2314
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_0

    .line 2315
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 2316
    .local v7, "ledCount":Ljava/lang/Integer;
    if-nez v7, :cond_1

    .line 2317
    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    .line 2319
    :cond_1
    if-nez v6, :cond_2

    .line 2321
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v12

    add-int/lit8 v12, v12, 0x1

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2324
    :cond_2
    invoke-interface {v4, v3, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 2329
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "groupID":Ljava/lang/String;
    .end local v6    # "inActive":I
    .end local v7    # "ledCount":Ljava/lang/Integer;
    :cond_3
    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 2330
    .local v2, "groupEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 2331
    .restart local v3    # "groupID":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/Integer;

    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v7

    .line 2333
    .local v7, "ledCount":I
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Deleting LEDs in Offline Groups. GroupID: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; LedCount: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2334
    if-nez v7, :cond_4

    .line 2336
    invoke-interface/range {p1 .. p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v12

    invoke-interface {v12}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v11

    .line 2337
    .local v11, "zigbeeDevicesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_5
    :goto_1
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_4

    .line 2338
    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 2339
    .local v1, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 2340
    .local v10, "udn":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getGroupID()Ljava/lang/String;

    move-result-object v8

    .line 2341
    .local v8, "ledGroupId":Ljava/lang/String;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Next LED. GroupID: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; UDN: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2342
    invoke-virtual {v8, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_5

    .line 2343
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v12, v10}, Lcom/belkin/wemo/cache/CacheManager;->isDeviceInDB(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_6

    .line 2344
    const-string v12, "DeviceListManager"

    const-string v13, "LED NOT Removed, as in cache.db"

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 2346
    :cond_6
    const-string v12, "DeviceListManager"

    const-string v13, "LED Removed, as not in cache.db"

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2347
    invoke-interface {v11}, Ljava/util/Iterator;->remove()V

    goto :goto_1

    .line 2353
    .end local v1    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v2    # "groupEntry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v3    # "groupID":Ljava/lang/String;
    .end local v7    # "ledCount":I
    .end local v8    # "ledGroupId":Ljava/lang/String;
    .end local v10    # "udn":Ljava/lang/String;
    .end local v11    # "zigbeeDevicesIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_7
    return-void
.end method

.method private removeUndiscoveredDevicesFromRemoteTable(Ljava/util/ArrayList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "devListFromCloud":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const/4 v8, 0x1

    const/4 v6, 0x0

    .line 3209
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v5, v6, v8, v6}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 3211
    .local v0, "devFromCache":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v2, 0x0

    .line 3212
    .local v2, "exist":Z
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 3213
    .local v1, "devFromCloud":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 3215
    const/4 v2, 0x1

    .line 3219
    .end local v1    # "devFromCloud":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_2
    if-nez v2, :cond_0

    .line 3220
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v6

    invoke-virtual {v5, v6, v8}, Lcom/belkin/wemo/cache/CacheManager;->hideDevice(IZ)V

    .line 3221
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDeviceInformation(Ljava/lang/String;)Z

    .line 3222
    const-string v5, "hide"

    const-string v6, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3225
    .end local v0    # "devFromCache":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "exist":Z
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_3
    return-void
.end method

.method private resetForcedRemoteFlag()V
    .locals 4

    .prologue
    .line 868
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v0

    .line 869
    .local v0, "isForcedRemoteEnabled":Z
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "resetForcedRemoteFlag: isForcedRemoteEnabled: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 870
    if-eqz v0, :cond_0

    .line 871
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setForcedRemoteEnabled(Z)V

    .line 872
    const-string v1, "set_remote"

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v2

    const-string v3, ""

    invoke-virtual {p0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 874
    :cond_0
    return-void
.end method

.method private restartLocalMode(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
    .locals 4
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    .line 850
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V

    .line 851
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 852
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startUnicastDiscovery()V

    .line 853
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startListen()V

    .line 854
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 855
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V

    .line 856
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$5;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$5;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Ljava/util/Timer;->schedule(Ljava/util/TimerTask;J)V

    .line 865
    return-void
.end method

.method private saveDeviceCache()V
    .locals 6

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 2794
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationArrayList()Ljava/util/ArrayList;

    move-result-object v0

    .line 2796
    .local v0, "devList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2797
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2798
    .local v1, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3, v1, v4, v5, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto :goto_0

    .line 2801
    .end local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .restart local v2    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2802
    .restart local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3, v1, v5, v4, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto :goto_1

    .line 2823
    .end local v1    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    return-void
.end method

.method public static saveIconToStorage(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "iconVersion"    # Ljava/lang/String;

    .prologue
    .line 6588
    const/4 v1, 0x0

    .line 6590
    .local v1, "file":Ljava/io/File;
    :try_start_0
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v2

    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3, p2, p1}, Lcom/belkin/wemo/storage/FileStorage;->getIconFile(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 6595
    :goto_0
    if-nez v1, :cond_0

    const-string v2, ""

    :goto_1
    return-object v2

    .line 6592
    :catch_0
    move-exception v0

    .line 6593
    .local v0, "e":Ljava/net/MalformedURLException;
    const-string v2, "DeviceListManager"

    const-string v3, "MalformedURLException while getting icon file: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 6595
    .end local v0    # "e":Ljava/net/MalformedURLException;
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method public static saveRemoteIconToStorage(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p0, "bmp"    # Landroid/graphics/Bitmap;
    .param p1, "mac"    # Ljava/lang/String;
    .param p2, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 6607
    const/4 v1, 0x0

    .line 6609
    .local v1, "iconPath":Ljava/lang/String;
    :try_start_0
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v2

    invoke-virtual {v2, p0, p1, p2}, Lcom/belkin/wemo/storage/FileStorage;->storeRemoteIcon(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 6610
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "new icon for MAC: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6614
    :goto_0
    if-nez v1, :cond_0

    const-string v1, ""

    .end local v1    # "iconPath":Ljava/lang/String;
    :cond_0
    return-object v1

    .line 6611
    .restart local v1    # "iconPath":Ljava/lang/String;
    :catch_0
    move-exception v0

    .line 6612
    .local v0, "e":Ljava/lang/Exception;
    const-string v2, "DeviceListManager"

    const-string v3, "Exception while saving icon file: "

    invoke-static {v2, v3, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method private scanZigBeeBridge(Ljava/lang/String;)V
    .locals 5
    .param p1, "bridgeDevice"    # Ljava/lang/String;

    .prologue
    .line 2250
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Discovery Zigbee: in scanZigBeeBridge. Bridge UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2251
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2261
    :cond_0
    :goto_0
    return-void

    .line 2253
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 2255
    new-instance v2, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;-><init>()V

    invoke-virtual {v2, p1, p0}, Lcom/belkin/wemo/cache/zigbee/impl/GetZigBeeDevicesFactory;->getGetZigBeeDevicesInstance(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;

    move-result-object v1

    .line 2256
    .local v1, "zigBeeDevices":Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;
    if-eqz v1, :cond_0

    .line 2257
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;

    invoke-direct {v0, p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    .line 2258
    .local v0, "callback":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FetchZigBeeDevicesCallback;
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->resetOfflineLEDCount()V

    .line 2259
    invoke-interface {v1, v0}, Lcom/belkin/wemo/cache/zigbee/IZigBeeDevices;->fetchZigBeeDevices(Lcom/belkin/wemo/cache/zigbee/IFetchZigBeeDevicesCallback;)V

    goto :goto_0
.end method

.method private sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "status"    # Ljava/lang/String;

    .prologue
    .line 4185
    const-string v0, "Discovery Success"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4186
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    const/4 v1, 0x1

    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 4193
    :cond_0
    :goto_0
    return-void

    .line 4187
    :cond_1
    const-string v0, "Discovery TimeOut"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4188
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    goto :goto_0
.end method

.method private startListen()V
    .locals 2

    .prologue
    .line 1105
    const-string v0, "Listeners"

    const-string v1, "in startListen"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1106
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-nez v0, :cond_0

    .line 1107
    new-instance v0, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v0}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 1109
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V

    .line 1110
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addEventListener(Lorg/cybergarage/upnp/event/EventListener;)V

    .line 1111
    return-void
.end method

.method private stopLocalMode()V
    .locals 1

    .prologue
    .line 842
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 843
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopListen()V

    .line 844
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopUnicastDiscovery()V

    .line 846
    :cond_0
    return-void
.end method

.method private synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    .locals 4
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "serialNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 3893
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v1

    .line 3894
    .local v1, "location":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 3895
    .local v2, "locationUrl":Ljava/net/URL;
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v0

    .line 3896
    .local v0, "fs":Lcom/belkin/wemo/storage/FileStorage;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/storage/FileStorage;->setReload(Z)V

    .line 3897
    invoke-virtual {v0, v2, p2}, Lcom/belkin/wemo/storage/FileStorage;->getDescriptionFile(Ljava/net/URL;Ljava/lang/String;)Ljava/io/File;

    .line 3898
    const/4 v3, 0x0

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/storage/FileStorage;->setReload(Z)V

    .line 3899
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->updateDevice(Lorg/cybergarage/upnp/Device;)V

    .line 3900
    return-void
.end method

.method private updateAttributeForMaker(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 10
    .param p1, "updateAttributeList"    # Ljava/lang/String;
    .param p2, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 3040
    const/4 v4, 0x0

    .line 3043
    .local v4, "preAttributeListJson":Lorg/json/JSONObject;
    :try_start_0
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v4

    .line 3044
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 3047
    .local v5, "updateAttributeListJson":Lorg/json/JSONObject;
    const-string v7, "attribute"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 3049
    .local v0, "attribute":Lorg/json/JSONObject;
    const-string v7, "name"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3050
    .local v3, "name":Ljava/lang/String;
    const-string v7, "value"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 3051
    .local v6, "value":Ljava/lang/String;
    invoke-static {v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->changeAttributes(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 3053
    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 3054
    .local v1, "changeJson":Lorg/json/JSONObject;
    const-string v7, "value"

    invoke-virtual {v1, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3055
    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {p2, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 3056
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "changeJson"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3063
    .end local v0    # "attribute":Lorg/json/JSONObject;
    .end local v1    # "changeJson":Lorg/json/JSONObject;
    .end local v3    # "name":Ljava/lang/String;
    .end local v5    # "updateAttributeListJson":Lorg/json/JSONObject;
    .end local v6    # "value":Ljava/lang/String;
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    return-object v7

    .line 3058
    :catch_0
    move-exception v2

    .line 3060
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_0
.end method

.method private updateAttributeList(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Ljava/lang/String;
    .locals 17
    .param p1, "attribute"    # Ljava/lang/String;
    .param p2, "wemodevice"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 3945
    const/4 v7, 0x0

    .line 3946
    .local v7, "preAttributeListJson":Lorg/json/JSONObject;
    new-instance v13, Ljava/lang/StringBuffer;

    invoke-direct {v13}, Ljava/lang/StringBuffer;-><init>()V

    .line 3947
    .local v13, "xmlString":Ljava/lang/StringBuffer;
    const-string v14, "<attributelist>"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3948
    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3949
    const-string v14, "</attributelist>"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 3950
    new-instance v14, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;

    invoke-direct {v14}, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;-><init>()V

    invoke-virtual {v13}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;->parseAttributeRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 3953
    .local v12, "updateAttributeJson":Lorg/json/JSONObject;
    if-eqz v12, :cond_1

    .line 3956
    :try_start_0
    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getAttributeList()Ljava/lang/String;

    move-result-object v3

    .line 3957
    .local v3, "attributeList":Ljava/lang/String;
    if-eqz v3, :cond_7

    const-string v14, ""

    invoke-virtual {v3, v14}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_7

    .line 3959
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 3960
    .end local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    .local v8, "preAttributeListJson":Lorg/json/JSONObject;
    :try_start_1
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "preAttributeListJson"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3964
    invoke-virtual {v12}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v6

    .line 3965
    .local v6, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_6

    .line 3966
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 3967
    .local v2, "attributeKey":Ljava/lang/String;
    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_0

    .line 3969
    invoke-virtual {v12, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 3971
    .local v11, "updateAttributeItemJson":Lorg/json/JSONObject;
    invoke-virtual {v8, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 3974
    .local v9, "prevAttributeItemJson":Lorg/json/JSONObject;
    const-string v14, "value"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 3976
    .local v4, "currentvalue":Ljava/lang/String;
    const-string v14, "value"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 3982
    .local v10, "prevvalue":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v14

    invoke-virtual {v14}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v14

    if-nez v14, :cond_5

    .line 3983
    const-string v14, "SwitchMode"

    invoke-virtual {v8, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 3985
    .local v1, "attributeItemJson":Lorg/json/JSONObject;
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Notification for"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 3986
    const-string v14, "value"

    invoke-virtual {v1, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const-string v15, "1"

    invoke-virtual {v14, v15}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 3989
    const-string v14, "Switch"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 3990
    const/4 v14, 0x0

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    .line 3991
    const-string v14, "0"

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 3992
    const-string v14, "value"

    const-string v15, "0"

    invoke-virtual {v9, v14, v15}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4001
    :goto_1
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "isNotificationComes ignore "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 4040
    .end local v1    # "attributeItemJson":Lorg/json/JSONObject;
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v4    # "currentvalue":Ljava/lang/String;
    .end local v6    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v9    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .end local v10    # "prevvalue":Ljava/lang/String;
    .end local v11    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :catch_0
    move-exception v5

    move-object v7, v8

    .line 4042
    .end local v3    # "attributeList":Ljava/lang/String;
    .end local v8    # "preAttributeListJson":Lorg/json/JSONObject;
    .local v5, "e":Lorg/json/JSONException;
    .restart local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    :goto_2
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    .line 4046
    .end local v5    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_3
    const/4 v14, 0x0

    :goto_4
    return-object v14

    .line 3996
    .end local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v1    # "attributeItemJson":Lorg/json/JSONObject;
    .restart local v2    # "attributeKey":Ljava/lang/String;
    .restart local v3    # "attributeList":Ljava/lang/String;
    .restart local v4    # "currentvalue":Ljava/lang/String;
    .restart local v6    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v8    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v9    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .restart local v10    # "prevvalue":Ljava/lang/String;
    .restart local v11    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :cond_2
    const/4 v14, 0x1

    :try_start_2
    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    .line 3997
    const-string v14, "value"

    invoke-virtual {v9, v14, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto :goto_1

    .line 4003
    :cond_3
    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 4004
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "isNotificationComes comes attributeKey ::"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4007
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    .line 4008
    const-string v14, "Switch"

    invoke-virtual {v2, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 4009
    const-string v14, "value"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 4013
    :cond_4
    const-string v14, "value"

    invoke-virtual {v9, v14, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 4018
    .end local v1    # "attributeItemJson":Lorg/json/JSONObject;
    :cond_5
    invoke-virtual {v4, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v14

    if-nez v14, :cond_0

    .line 4019
    const-string v14, "value"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p2

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 4022
    const-string v14, "value"

    invoke-virtual {v9, v14, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 4025
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "SMART: isNotificationComes comes attributeKey ::"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4028
    const/4 v14, 0x1

    move-object/from16 v0, p0

    iput-boolean v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isNotificationComes:Z

    goto/16 :goto_0

    .line 4033
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v4    # "currentvalue":Ljava/lang/String;
    .end local v9    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .end local v10    # "prevvalue":Ljava/lang/String;
    .end local v11    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :cond_6
    const-string v14, "DeviceListManager.updateAttributeList"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "updateAttributeJsons "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v12}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4036
    invoke-virtual {v8}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-result-object v14

    move-object v7, v8

    .end local v8    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    goto/16 :goto_4

    .line 4038
    .end local v6    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_7
    :try_start_3
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Device: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string v16, "  attributeList: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_1

    goto/16 :goto_3

    .line 4040
    .end local v3    # "attributeList":Ljava/lang/String;
    :catch_1
    move-exception v5

    goto/16 :goto_2
.end method

.method public static updateCapabilityProfileTable()V
    .locals 3

    .prologue
    .line 6958
    const-string v0, "ZigbeeScan"

    const-string v1, "updateCapabilityProfileTable"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6959
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-nez v0, :cond_0

    .line 6960
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    .line 6962
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "10006"

    const-string v2, "onOff"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6963
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "10008"

    const-string v2, "levelControl"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6964
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "30008"

    const-string v2, "sleepFader"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6965
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "30009"

    const-string v2, "levelControlMove"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6966
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "3000A"

    const-string v2, "levelControlStop"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6967
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "10003"

    const-string v2, "identify"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6968
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "10300"

    const-string v2, "colorControl"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6969
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "30301"

    const-string v2, "colorTemperature"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6970
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "10500"

    const-string v2, "iasZone"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6971
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "20500"

    const-string v2, "sensorConfig"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6972
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "30501"

    const-string v2, "sensorTestMode"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6973
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const-string v1, "20502"

    const-string v2, "sensorKeyPress"

    invoke-virtual {v0, v1, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 6975
    :cond_0
    return-void
.end method

.method private updateDeviceNameInListAndCache(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V
    .locals 6
    .param p1, "device"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 2554
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V

    .line 2557
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v4, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 2559
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 2560
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 2561
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, v0, v4, v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->updateDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 2563
    :cond_0
    const-string v1, "update"

    const-string v2, ""

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2564
    return-void
.end method

.method private updateDeviceToDBDevicesTable(Lcom/belkin/wemo/cache/data/DeviceInformation;)Z
    .locals 4
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v3, 0x0

    .line 1916
    const/4 v0, 0x0

    .line 1917
    .local v0, "isUpdate":Z
    if-eqz p1, :cond_0

    .line 1918
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v3, v3, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1919
    const/4 v0, 0x1

    .line 1921
    :cond_0
    return v0
.end method

.method private updateDeviceToDBDevicesTable(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Z
    .locals 6
    .param p1, "wemodevice"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 1901
    const/4 v1, 0x0

    .line 1902
    .local v1, "isUpdate":Z
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 1904
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v0, :cond_0

    .line 1905
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v2, v4, v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v2

    invoke-direct {p0, p1, v2, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromList(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;Ljava/util/ArrayList;ZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 1909
    :cond_0
    if-eqz v0, :cond_1

    .line 1910
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v2, v0, v4, v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->updateDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1911
    const/4 v1, 0x1

    .line 1913
    :cond_1
    return v1
.end method

.method private updateDeviceToDBLocalTable(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Z
    .locals 5
    .param p1, "wemodevice"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 1888
    const/4 v1, 0x0

    .line 1889
    .local v1, "isUpdate":Z
    const/4 v0, 0x0

    .line 1890
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v2, v4, v3, v3}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v2

    invoke-direct {p0, p1, v2, v4, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromList(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;Ljava/util/ArrayList;ZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 1893
    if-eqz v0, :cond_0

    .line 1894
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v2, v0, v4, v3, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1895
    const/4 v1, 0x1

    .line 1897
    :cond_0
    return v1
.end method

.method private updateWeMoDevice(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)Z
    .locals 27
    .param p1, "wemoDevice"    # Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .prologue
    .line 3265
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v13

    .line 3266
    .local v13, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v13, :cond_11

    .line 3267
    const/4 v15, 0x0

    .line 3268
    .local v15, "deviceInformation":[Ljava/lang/String;
    const-string v20, ""

    .line 3269
    .local v20, "friendlyName":Ljava/lang/String;
    const-string v8, ""

    .line 3270
    .local v8, "binaryState":Ljava/lang/String;
    const-string v21, ""

    .line 3271
    .local v21, "iconVersion":Ljava/lang/String;
    const-string v10, ""

    .line 3272
    .local v10, "configureState":Ljava/lang/String;
    const-string v12, ""

    .line 3273
    .local v12, "customizedState":Ljava/lang/String;
    const-string v19, ""

    .line 3274
    .local v19, "firmwareVersion":Ljava/lang/String;
    const-string v9, ""

    .line 3275
    .local v9, "brandName":Ljava/lang/String;
    const-string v22, ""

    .line 3276
    .local v22, "productName":Ljava/lang/String;
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getCustomizedInformationFromDevice()Ljava/util/Map;

    move-result-object v11

    .line 3277
    .local v11, "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const/4 v4, 0x0

    .line 3278
    .local v4, "attributeList":Lorg/json/JSONObject;
    if-eqz v11, :cond_4

    .line 3280
    const-string v24, "FriendlyName"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v20

    .end local v20    # "friendlyName":Ljava/lang/String;
    check-cast v20, Ljava/lang/String;

    .line 3281
    .restart local v20    # "friendlyName":Ljava/lang/String;
    const-string v24, "binaryState"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    .end local v8    # "binaryState":Ljava/lang/String;
    check-cast v8, Ljava/lang/String;

    .line 3282
    .restart local v8    # "binaryState":Ljava/lang/String;
    const-string v24, "iconVersion"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v21

    .end local v21    # "iconVersion":Ljava/lang/String;
    check-cast v21, Ljava/lang/String;

    .line 3283
    .restart local v21    # "iconVersion":Ljava/lang/String;
    const-string v24, "CustomizedState"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "customizedState":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 3284
    .restart local v12    # "customizedState":Ljava/lang/String;
    const-string v24, "brandName"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    if-eqz v24, :cond_0

    .line 3285
    const-string v24, "brandName"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "brandName":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 3288
    .restart local v9    # "brandName":Ljava/lang/String;
    :cond_0
    const-string v24, "productName"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    if-eqz v24, :cond_1

    .line 3289
    const-string v24, "productName"

    move-object/from16 v0, v24

    invoke-interface {v11, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "productName":Ljava/lang/String;
    check-cast v22, Ljava/lang/String;

    .line 3292
    .restart local v22    # "productName":Ljava/lang/String;
    :cond_1
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager : updateWeMoDevice customizedState: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " friendlyName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " binaryState: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " iconVersion: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " udn: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " brandName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " productName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3318
    :cond_2
    :goto_0
    if-eqz v8, :cond_3

    const-string v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_8

    .line 3319
    :cond_3
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager : remove "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3321
    const/16 v24, 0x0

    .line 3408
    .end local v4    # "attributeList":Lorg/json/JSONObject;
    .end local v8    # "binaryState":Ljava/lang/String;
    .end local v9    # "brandName":Ljava/lang/String;
    .end local v10    # "configureState":Ljava/lang/String;
    .end local v11    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "customizedState":Ljava/lang/String;
    .end local v15    # "deviceInformation":[Ljava/lang/String;
    .end local v19    # "firmwareVersion":Ljava/lang/String;
    .end local v20    # "friendlyName":Ljava/lang/String;
    .end local v21    # "iconVersion":Ljava/lang/String;
    .end local v22    # "productName":Ljava/lang/String;
    :goto_1
    return v24

    .line 3298
    .restart local v4    # "attributeList":Lorg/json/JSONObject;
    .restart local v8    # "binaryState":Ljava/lang/String;
    .restart local v9    # "brandName":Ljava/lang/String;
    .restart local v10    # "configureState":Ljava/lang/String;
    .restart local v11    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v12    # "customizedState":Ljava/lang/String;
    .restart local v15    # "deviceInformation":[Ljava/lang/String;
    .restart local v19    # "firmwareVersion":Ljava/lang/String;
    .restart local v20    # "friendlyName":Ljava/lang/String;
    .restart local v21    # "iconVersion":Ljava/lang/String;
    .restart local v22    # "productName":Ljava/lang/String;
    :cond_4
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v15

    if-nez v15, :cond_7

    .line 3301
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getFriendlyNameFromDevice()Ljava/lang/String;

    move-result-object v20

    .line 3302
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager : updateWeMoDevice friendlyName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3305
    if-eqz v20, :cond_5

    invoke-virtual/range {v20 .. v20}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->length()I

    move-result v24

    if-nez v24, :cond_6

    .line 3306
    :cond_5
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v20

    .line 3307
    :cond_6
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getBinaryStateFromDevice()Ljava/lang/String;

    move-result-object v8

    .line 3308
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getFirmwareVersionFromDevice()Ljava/lang/String;

    move-result-object v19

    goto :goto_0

    .line 3310
    :cond_7
    const/16 v24, 0x5

    aget-object v20, v15, v24

    .line 3311
    const/16 v24, 0x4

    aget-object v8, v15, v24

    .line 3312
    const/16 v24, 0x2

    aget-object v21, v15, v24

    .line 3313
    const/16 v24, 0x1

    aget-object v19, v15, v24

    .line 3314
    array-length v0, v15

    move/from16 v24, v0

    const/16 v25, 0x6

    move/from16 v0, v24

    move/from16 v1, v25

    if-le v0, v1, :cond_2

    .line 3315
    const/16 v24, 0x6

    aget-object v9, v15, v24

    goto/16 :goto_0

    .line 3325
    :cond_8
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v24

    move-object/from16 v0, p0

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    move-result v24

    if-nez v24, :cond_9

    .line 3326
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager : subscription failed "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 3328
    const/16 v24, 0x0

    goto/16 :goto_1

    .line 3332
    :cond_9
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager : update "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " friendlyName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " binaryState: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " firmwareVersion "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    const-string v26, " brandName: "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    move-object/from16 v0, v25

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3339
    const/16 v24, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setAvailability(Z)V

    .line 3341
    move-object/from16 v0, p1

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 3343
    move-object/from16 v0, v20

    invoke-virtual {v13, v0}, Lorg/cybergarage/upnp/Device;->setFriendlyName(Ljava/lang/String;)V

    .line 3344
    move-object/from16 v0, p1

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setFriendlyName(Ljava/lang/String;)V

    .line 3345
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setCustomizedState(Ljava/lang/String;)V

    .line 3346
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setBrandName(Ljava/lang/String;)V

    .line 3347
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setProductName(Ljava/lang/String;)V

    .line 3348
    move-object/from16 v0, p1

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setFirmwareVersion(Ljava/lang/String;)V

    .line 3349
    invoke-virtual {v13, v10}, Lorg/cybergarage/upnp/Device;->setConfigureState(Ljava/lang/String;)V

    .line 3351
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v24

    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/cache/utils/IsDevice;->Maker(Ljava/lang/String;)Z

    move-result v24

    if-eqz v24, :cond_b

    .line 3352
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getAttributeList()Ljava/lang/String;

    move-result-object v14

    .line 3354
    .local v14, "deviceAttributeList":Ljava/lang/String;
    :try_start_0
    const-string v24, ""

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_a

    const-string v24, "null"

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-nez v24, :cond_a

    const/16 v24, 0x0

    move-object/from16 v0, v24

    invoke-virtual {v14, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_e

    .line 3357
    :cond_a
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getAttriuteListFromDevice()Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v4

    .line 3364
    :goto_2
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getAttributetParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v7

    .line 3366
    .local v7, "attributes":Lorg/json/JSONObject;
    invoke-virtual {v13, v4, v7}, Lorg/cybergarage/upnp/Device;->updateAttributesList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v23

    .line 3368
    .local v23, "updateAttributeList":Lorg/json/JSONObject;
    if-eqz v23, :cond_b

    .line 3369
    invoke-virtual/range {v23 .. v23}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setAttributeList(Ljava/lang/String;)V

    .line 3372
    .end local v7    # "attributes":Lorg/json/JSONObject;
    .end local v14    # "deviceAttributeList":Ljava/lang/String;
    .end local v23    # "updateAttributeList":Lorg/json/JSONObject;
    :cond_b
    const/16 v18, 0x0

    .line 3374
    .local v18, "file":Ljava/io/File;
    :try_start_1
    const-string v24, "0"

    move-object/from16 v0, v21

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v24

    if-eqz v24, :cond_f

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v24

    const-string v25, "uuid:Maker"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v24

    if-eqz v24, :cond_f

    .line 3376
    sget-object v24, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v24

    new-instance v25, Ljava/net/URL;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/storage/FileStorage;->storeDefaultIcon(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v18

    .line 3388
    :goto_3
    if-nez v18, :cond_10

    const-string v24, ""

    :goto_4
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setLogo(Ljava/lang/String;)V

    .line 3391
    const-string v24, "WeMoSDK"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "DeviceListManager :device.getDeviceType() "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3393
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v24

    const-string v25, "Heater"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_c

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v24

    const-string v25, "Humidifier"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_c

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v24

    const-string v25, "AirPurifier"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v24

    if-nez v24, :cond_c

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v24

    const-string v25, "CoffeeMaker"

    invoke-virtual/range {v24 .. v25}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v24

    if-eqz v24, :cond_d

    .line 3397
    :cond_c
    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getAttriuteListFromDevice()Lorg/json/JSONObject;

    move-result-object v6

    .line 3399
    .local v6, "attributeListObj":Lorg/json/JSONObject;
    if-eqz v6, :cond_d

    .line 3400
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v24

    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->setAttributeList(Ljava/lang/String;)V

    .line 3406
    .end local v6    # "attributeListObj":Lorg/json/JSONObject;
    :cond_d
    const/16 v24, 0x1

    goto/16 :goto_1

    .line 3359
    .end local v18    # "file":Ljava/io/File;
    .restart local v14    # "deviceAttributeList":Ljava/lang/String;
    :cond_e
    :try_start_2
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v14}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .end local v4    # "attributeList":Lorg/json/JSONObject;
    .local v5, "attributeList":Lorg/json/JSONObject;
    move-object v4, v5

    .end local v5    # "attributeList":Lorg/json/JSONObject;
    .restart local v4    # "attributeList":Lorg/json/JSONObject;
    goto/16 :goto_2

    .line 3361
    :catch_0
    move-exception v17

    .line 3362
    .local v17, "ex":Ljava/lang/Exception;
    const-string v24, "DeviceListManager"

    new-instance v25, Ljava/lang/StringBuilder;

    invoke-direct/range {v25 .. v25}, Ljava/lang/StringBuilder;-><init>()V

    const-string v26, "Exception in attribute list "

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v17 .. v17}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v26

    invoke-virtual/range {v25 .. v26}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v25

    invoke-virtual/range {v25 .. v25}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v25

    invoke-static/range {v24 .. v25}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 3380
    .end local v14    # "deviceAttributeList":Ljava/lang/String;
    .end local v17    # "ex":Ljava/lang/Exception;
    .restart local v18    # "file":Ljava/io/File;
    :cond_f
    const/16 v24, 0x0

    :try_start_3
    invoke-static/range {v24 .. v24}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v24

    new-instance v25, Ljava/net/URL;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v26

    invoke-direct/range {v25 .. v26}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v26

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v21

    move-object/from16 v3, v26

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/storage/FileStorage;->getIconFile(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v18

    goto/16 :goto_3

    .line 3384
    :catch_1
    move-exception v16

    .line 3385
    .local v16, "e":Ljava/net/MalformedURLException;
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v24

    invoke-virtual/range {v24 .. v24}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v24

    const-string v25, "Incorrect logo url "

    move-object/from16 v0, v24

    move-object/from16 v1, v25

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto/16 :goto_3

    .line 3388
    .end local v16    # "e":Ljava/net/MalformedURLException;
    :cond_10
    invoke-virtual/range {v18 .. v18}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v24

    goto/16 :goto_4

    .line 3408
    .end local v4    # "attributeList":Lorg/json/JSONObject;
    .end local v8    # "binaryState":Ljava/lang/String;
    .end local v9    # "brandName":Ljava/lang/String;
    .end local v10    # "configureState":Ljava/lang/String;
    .end local v11    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "customizedState":Ljava/lang/String;
    .end local v15    # "deviceInformation":[Ljava/lang/String;
    .end local v18    # "file":Ljava/io/File;
    .end local v19    # "firmwareVersion":Ljava/lang/String;
    .end local v20    # "friendlyName":Ljava/lang/String;
    .end local v21    # "iconVersion":Ljava/lang/String;
    .end local v22    # "productName":Ljava/lang/String;
    :cond_11
    const/16 v24, 0x0

    goto/16 :goto_1
.end method


# virtual methods
.method public addDeviceWithOnlyUDNToLocalOrRemoteTable(Ljava/lang/String;ZZ)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "toLocal"    # Z
    .param p3, "toRemote"    # Z

    .prologue
    .line 2595
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    const-string v1, ""

    const-string v2, ""

    const-string v3, ""

    invoke-direct {v0, p1, v1, v2, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2596
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p2, p3, v2}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 2597
    return-void
.end method

.method public addGroup(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Z)V
    .locals 17
    .param p1, "operation"    # Ljava/lang/String;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupProperties"    # Lorg/json/JSONObject;
    .param p4, "isNewGroup"    # Z

    .prologue
    .line 7174
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 7177
    .local v3, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v14

    if-eqz v14, :cond_1

    .line 7178
    new-instance v13, Lcom/belkin/wemo/cache/network/LEDOperations;

    const-string v14, "CreateGroup"

    invoke-static/range {p4 .. p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v15

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    invoke-direct {v13, v14, v0, v1, v15}, Lcom/belkin/wemo/cache/network/LEDOperations;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/Boolean;)V

    .line 7179
    .local v13, "operations":Lcom/belkin/wemo/cache/network/LEDOperations;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v14

    invoke-virtual {v14, v13}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 7186
    .end local v13    # "operations":Lcom/belkin/wemo/cache/network/LEDOperations;
    :goto_0
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v14}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v14

    if-eqz v14, :cond_4

    .line 7189
    :try_start_0
    const-string v14, "groupID"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 7190
    .local v8, "groupId":Ljava/lang/String;
    const/4 v11, 0x0

    .line 7191
    .local v11, "iconLocation":Ljava/lang/String;
    const-string v14, "groupIcon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    if-eqz v14, :cond_2

    .line 7192
    const-string v14, "groupIcon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 7203
    :cond_0
    const-string v14, "file:///android_asset/"

    invoke-virtual {v11, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_3

    .line 7206
    const-string v14, "file:///android_asset/"

    invoke-virtual {v14}, Ljava/lang/String;->length()I

    move-result v14

    invoke-virtual {v11, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v11

    .line 7207
    sget-object v14, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v14}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v14

    invoke-virtual {v14, v11}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v14

    invoke-static {v14}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v10

    .line 7213
    .local v10, "iconBitmap":Landroid/graphics/Bitmap;
    :goto_1
    sget-object v14, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v14}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v14

    invoke-virtual {v14, v10, v8, v8}, Lcom/belkin/wemo/storage/FileStorage;->storeRemoteIcon(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 7214
    const-string v14, "icon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7216
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;

    sget-object v15, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v14, v15, v8, v11}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetGroupIcon;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 7226
    .end local v8    # "groupId":Ljava/lang/String;
    .end local v10    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v11    # "iconLocation":Ljava/lang/String;
    :goto_2
    return-void

    .line 7181
    :cond_1
    const-string v14, "DeviceListManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "calling CloudRequestAddEditGroup:  "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    move-object/from16 v0, p3

    invoke-virtual {v15, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7182
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;

    sget-object v15, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p2

    move-object/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v14, v15, v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddOrEditGroup;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Z)V

    invoke-virtual {v3, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 7194
    .restart local v8    # "groupId":Ljava/lang/String;
    .restart local v11    # "iconLocation":Ljava/lang/String;
    :cond_2
    :try_start_1
    const-string v14, "deviceID"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 7195
    .local v6, "deviceIDs":Lorg/json/JSONArray;
    const-string v14, "deviceCapabilities"

    move-object/from16 v0, p3

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 7196
    .local v4, "deviceCapabilities":Lorg/json/JSONObject;
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_3
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v9, v14, :cond_0

    .line 7198
    invoke-virtual {v6, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 7199
    .local v5, "deviceID":Ljava/lang/String;
    move-object/from16 v0, p0

    invoke-virtual {v0, v5, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapabilities(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    .line 7200
    .local v12, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getManufacturerName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    .line 7196
    add-int/lit8 v9, v9, 0x1

    goto :goto_3

    .line 7209
    .end local v4    # "deviceCapabilities":Lorg/json/JSONObject;
    .end local v5    # "deviceID":Ljava/lang/String;
    .end local v6    # "deviceIDs":Lorg/json/JSONArray;
    .end local v9    # "i":I
    .end local v12    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    invoke-static {v11}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v10

    .restart local v10    # "iconBitmap":Landroid/graphics/Bitmap;
    goto :goto_1

    .line 7217
    .end local v8    # "groupId":Ljava/lang/String;
    .end local v10    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v11    # "iconLocation":Ljava/lang/String;
    :catch_0
    move-exception v7

    .line 7218
    .local v7, "e":Lorg/json/JSONException;
    const-string v14, "DeviceListManager"

    const-string v15, "JSONException in addGroup: "

    invoke-static {v14, v15, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2

    .line 7219
    .end local v7    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v7

    .line 7220
    .local v7, "e":Ljava/io/IOException;
    const-string v14, "DeviceListManager"

    const-string v15, "IOException in addGroup: "

    invoke-static {v14, v15, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2

    .line 7223
    .end local v7    # "e":Ljava/io/IOException;
    :cond_4
    const-string v14, "DeviceListManager"

    const-string v15, "addGroup(): ERROR - Remote access is not enabled."

    invoke-static {v14, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public addLocationCloud(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
    .param p2, "currentHomeId"    # Ljava/lang/String;
    .param p3, "locationName"    # Ljava/lang/String;

    .prologue
    .line 6758
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "addLocation lastSSID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isLocal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " lastModeLocal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " locationName: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " currentHomeId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 6761
    new-instance v9, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;

    invoke-direct {v9}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;-><init>()V

    .line 6763
    .local v9, "wiFiSecurityUtil":Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/utils/WiFiSecurityUtil;->getDeviceID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    .line 6764
    .local v3, "deviceId":Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getMacFromArpCache()Ljava/lang/String;

    move-result-object v4

    .line 6765
    .local v4, "arpMac":Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v5

    .line 6767
    .local v5, "ssid":Ljava/lang/String;
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v8, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6768
    .local v8, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object v1, p0

    move-object v6, p2

    move-object v7, p3

    invoke-direct/range {v0 .. v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestAddLocation;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6770
    return-void
.end method

.method public addLocationDB(Lcom/belkin/wemo/cache/location/Location;)V
    .locals 1
    .param p1, "location"    # Lcom/belkin/wemo/cache/location/Location;

    .prologue
    .line 6670
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->addLocationToDB(Lcom/belkin/wemo/cache/location/Location;)Z

    .line 6671
    return-void
.end method

.method public addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
    .locals 2
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    .line 1158
    if-nez p1, :cond_0

    .line 1159
    const-string v0, "Listeners"

    const-string v1, "listener is null returning.."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1178
    :goto_0
    return-void

    .line 1162
    :cond_0
    const-string v0, "Listeners"

    const-string v1, "adding Notification Listener"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1163
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    if-nez v0, :cond_1

    .line 1164
    new-instance v0, Ljava/util/concurrent/ConcurrentSkipListSet;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$7;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$7;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v0, v1}, Ljava/util/concurrent/ConcurrentSkipListSet;-><init>(Ljava/util/Comparator;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    .line 1172
    :cond_1
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 1173
    const-string v0, "Listeners"

    const-string v1, "added Notification Listener"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1174
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1176
    :cond_2
    const-string v0, "Listeners"

    const-string v1, "Notification Listener already exists"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 1
    .param p1, "devInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 4732
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    if-eqz v0, :cond_0

    .line 4733
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4735
    :cond_0
    return-void
.end method

.method public areNestFirmwareSupported()Z
    .locals 11

    .prologue
    .line 7474
    const/4 v7, 0x1

    .line 7475
    .local v7, "isNestSupportedFW":Z
    const-string v9, "DeviceListManager"

    const-string v10, "Checking for Nest firmware Supported devices."

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7476
    const-string v5, ""

    .line 7478
    .local v5, "fw_version":Ljava/lang/String;
    :try_start_0
    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    .line 7479
    .local v0, "cachedDevices":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v9

    if-lez v9, :cond_2

    .line 7480
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    .local v6, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 7481
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v9

    if-eqz v9, :cond_0

    .line 7482
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    .line 7483
    .local v2, "deviceUdn":Ljava/lang/String;
    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->LightSocket(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Maker(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_1

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Switch(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_0

    :cond_1
    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/IsDevice;->Smart(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_0

    .line 7484
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v5

    .line 7485
    const-string v9, "\\."

    invoke-virtual {v5, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v8

    .line 7486
    .local v8, "values":[Ljava/lang/String;
    array-length v9, v8

    const/4 v10, 0x1

    if-le v9, v10, :cond_0

    .line 7487
    const/4 v9, 0x2

    aget-object v9, v8, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    .line 7488
    .local v4, "firmwareVersion":I
    const/16 v9, 0x2797

    if-ge v4, v9, :cond_0

    .line 7489
    const/4 v7, 0x0

    .line 7500
    .end local v0    # "cachedDevices":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "deviceUdn":Ljava/lang/String;
    .end local v4    # "firmwareVersion":I
    .end local v6    # "i$":Ljava/util/Iterator;
    .end local v8    # "values":[Ljava/lang/String;
    :cond_2
    :goto_0
    return v7

    .line 7497
    :catch_0
    move-exception v3

    .line 7498
    .local v3, "e":Ljava/lang/Exception;
    const-string v9, "DeviceListManager"

    const-string v10, "Exception: "

    invoke-static {v9, v10, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public calibrate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "binaryState"    # Ljava/lang/String;
    .param p3, "fader"    # Ljava/lang/String;
    .param p4, "level"    # Ljava/lang/String;
    .param p5, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;
    .param p6, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;

    .prologue
    .line 1598
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 1599
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v3

    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1600
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_1

    .line 1601
    const-string v3, "Calibrate"

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1602
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_0

    .line 1603
    const-string v3, "binaryState"

    invoke-virtual {v0, v3, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1604
    const-string v3, "level"

    invoke-virtual {v0, v3, p4}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1605
    const-string v3, "fader"

    invoke-virtual {v0, v3, p3}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1606
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v3

    new-instance v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$10;

    invoke-direct {v4, p0, p6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$10;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V

    new-instance v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;

    invoke-direct {v5, p0, p5, p6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$11;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;)V

    invoke-virtual {v3, v0, v4, v5}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 1647
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 1634
    .restart local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    const-string v2, "calibrate: Control Point object is NULL"

    .line 1635
    .local v2, "error":Ljava/lang/String;
    const-string v3, "DeviceListManager"

    invoke-static {v3, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1636
    if-eqz p6, :cond_0

    .line 1637
    invoke-interface {p6, v2}, Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;->onCalibrationFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1641
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "error":Ljava/lang/String;
    :cond_2
    const-string v2, "calibrate: SetBulbType API not suppoted in REMOTE mode."

    .line 1642
    .restart local v2    # "error":Ljava/lang/String;
    const-string v3, "DeviceListManager"

    invoke-static {v3, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1643
    if-eqz p6, :cond_0

    .line 1644
    invoke-interface {p6, v2}, Lcom/belkin/wemo/cache/devicelist/callback/CalibrateErrorCallback;->onCalibrationFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public changeLocation(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;Ljava/lang/String;)V
    .locals 3
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
    .param p2, "locationHomeId"    # Ljava/lang/String;

    .prologue
    .line 907
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "changeLocation lastSSID: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " isLocal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " lastModeLocal: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " locationHomeId: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 909
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->setCurrentLocationHomeId(Ljava/lang/String;)V

    .line 910
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onNetworkChange(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 911
    return-void
.end method

.method public checkAppRecovery()V
    .locals 5

    .prologue
    .line 6823
    const-string v2, "DeviceListManager"

    const-string v3, " :: inside checkAppRecovery :: "

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6824
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getHomeId()Ljava/lang/String;

    move-result-object v1

    .line 6825
    .local v1, "strHomeID":Ljava/lang/String;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6826
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    invoke-direct {v2, v3, v4, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForAppRecovery;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6827
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 1008
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 1009
    return-void
.end method

.method public collectEmailIDToCloud()V
    .locals 10

    .prologue
    .line 7530
    const-string v6, "DeviceListManager"

    const-string v7, "collectEmailIDToCloud called- "

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7531
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailIds()Ljava/lang/String;

    move-result-object v3

    .line 7532
    .local v3, "emaildId":Ljava/lang/String;
    const/4 v5, 0x0

    .line 7533
    .local v5, "optFlag":Z
    const/4 v2, 0x0

    .line 7536
    .local v2, "emailAddress":Ljava/lang/String;
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7537
    .local v4, "jsonObject":Lorg/json/JSONObject;
    const-string v6, "optIn"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v5

    .line 7538
    const-string v6, "email"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 7542
    .end local v4    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailOptDeviceType()Ljava/lang/String;

    move-result-object v0

    .line 7543
    .local v0, "deviceType":Ljava/lang/String;
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "emaildId- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ;deviceType- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ;optFlag- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ;emailAddress- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " ;remoteAccessManager.isRemoteEnabled()- "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7546
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 7547
    const-string v6, "DeviceListManager"

    const-string v7, "Collect EmailID: SUCCESS- Remote access is enabled."

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7549
    if-eqz v5, :cond_1

    .line 7551
    :try_start_1
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v6

    new-instance v7, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v7, v8, v2, v0, v9}, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;)V

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 7554
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v6

    new-instance v7, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToITServerRequestRunnable;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v7, v8, v2, v0}, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToITServerRequestRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 7569
    :cond_0
    :goto_1
    return-void

    .line 7539
    .end local v0    # "deviceType":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 7540
    .local v1, "e":Lorg/json/JSONException;
    const-string v6, "DeviceListManager"

    const-string v7, "Exception: "

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 7557
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v0    # "deviceType":Ljava/lang/String;
    :cond_1
    :try_start_2
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v6

    new-instance v7, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v7, v8, v2, v0, v9}, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;)V

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    .line 7559
    :catch_1
    move-exception v1

    .line 7560
    .local v1, "e":Ljava/lang/Exception;
    const-string v6, "DeviceListManager"

    const-string v7, "Exception: "

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 7563
    .end local v1    # "e":Ljava/lang/Exception;
    :cond_2
    const-string v6, "DeviceListManager"

    const-string v7, "Collect EmailID: ERROR - Remote access is not enabled."

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7564
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->emailSubscriptionOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;

    if-nez v6, :cond_0

    .line 7565
    new-instance v6, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;

    invoke-direct {v6}, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;-><init>()V

    iput-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->emailSubscriptionOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;

    .line 7566
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->emailSubscriptionOnRemoteAccessListener:Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    goto :goto_1
.end method

.method public configureDimmingRange(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "minBrightness"    # Ljava/lang/String;
    .param p3, "maxBrightness"    # Ljava/lang/String;
    .param p4, "turnOnBrightness"    # Ljava/lang/String;
    .param p5, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeSuccessCallback;
    .param p6, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;

    .prologue
    .line 1549
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "configureDimmingRange: UDN: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; minBrightness: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; maxBrightness: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; turnONBrightness: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1550
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1551
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v2

    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 1552
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_0

    .line 1553
    const-string v2, "ConfigureDimmingRange"

    invoke-virtual {v1, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 1554
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v0, :cond_1

    .line 1555
    const-string v2, "minLevel"

    invoke-virtual {v0, v2, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1556
    const-string v2, "maxLevel"

    invoke-virtual {v0, v2, p3}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1557
    const-string v2, "turnOnLevel"

    invoke-virtual {v0, v2, p4}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1560
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v2

    new-instance v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$8;

    invoke-direct {v3, p0, p6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$8;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V

    new-instance v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;

    invoke-direct {v4, p0, p6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$9;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;)V

    invoke-virtual {v2, v0, v3, v4}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 1594
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 1583
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    if-eqz p6, :cond_0

    .line 1584
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ERROR: ConfigureDimmingRange Action NOT PRESENT for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p6, v2}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;->onDimmingConfigurationError(Ljava/lang/String;)V

    goto :goto_0

    .line 1589
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-eqz p6, :cond_0

    .line 1590
    const-string v2, "ERROR: ConfigureDimmingRange API works ONLY in LOCAL mode."

    invoke-interface {p6, v2}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureDimmingRangeErrorCallback;->onDimmingConfigurationError(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public configureHushMode(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V
    .locals 11
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "hushModeValue"    # Ljava/lang/String;
    .param p3, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;

    .prologue
    .line 1806
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v2

    .line 1808
    .local v2, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v2, :cond_2

    .line 1809
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 1811
    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 1812
    .local v7, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v7, :cond_0

    .line 1813
    const-string v1, "ConfigureHushMode"

    invoke-virtual {v7, v1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v6

    .line 1814
    .local v6, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v6, :cond_0

    .line 1815
    const-string v1, "hushMode"

    invoke-virtual {v6, v1, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1816
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v9

    new-instance v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;

    invoke-direct {v10, p0, p4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$16;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V

    new-instance v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;

    move-object v1, p0

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$17;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V

    invoke-virtual {v9, v6, v10, v0}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 1875
    .end local v6    # "action":Lorg/cybergarage/upnp/Action;
    .end local v7    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 1863
    :cond_1
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;)V

    .line 1864
    .local v0, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 1868
    .end local v0    # "request":Lcom/belkin/wemo/cache/cloud/CloudRequestConfigureHushMode;
    :cond_2
    const-string v8, "configureHushMode: DeviceInformation object is NULL"

    .line 1869
    .local v8, "error":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    invoke-static {v1, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1870
    if-eqz p4, :cond_0

    .line 1871
    invoke-interface {p4, v8}, Lcom/belkin/wemo/cache/devicelist/callback/ConfigureHushModeErrorCallback;->onConfigureHushModeFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public createAttributeList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 9
    .param p1, "attributeList"    # Lorg/json/JSONObject;
    .param p2, "deviceAttributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 4564
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 4566
    .local v4, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v2

    .line 4568
    .local v2, "deviceKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 4570
    const-string v5, "NULL"

    .line 4571
    .local v5, "value":Ljava/lang/String;
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 4572
    .local v0, "attributeKey":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 4573
    .local v3, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    .line 4574
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 4575
    .local v1, "deviceAttributeKey":Ljava/lang/String;
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 4576
    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 4579
    .end local v1    # "deviceAttributeKey":Ljava/lang/String;
    :cond_1
    const-string v6, "<attribute>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4580
    const-string v6, "<name>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4581
    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/StringUtils;->toUpperCamelCase(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4582
    const-string v6, "</name>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4583
    const-string v6, "<value>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4584
    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4585
    const-string v6, "</value>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 4586
    const-string v6, "</attribute>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    goto :goto_0

    .line 4588
    .end local v0    # "attributeKey":Ljava/lang/String;
    .end local v3    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v5    # "value":Ljava/lang/String;
    :cond_2
    const-string v6, "setAttriuteState"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "str.toString():::::::;"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4589
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v6

    return-object v6
.end method

.method public deActivateNest()V
    .locals 5

    .prologue
    .line 7459
    const-string v3, "DeviceListManager"

    const-string v4, "Deactivating Nest: "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7461
    :try_start_0
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    .line 7462
    .local v2, "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 7463
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 7467
    .end local v0    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestForNestDeactivation;
    :goto_0
    return-void

    .line 7464
    :catch_0
    move-exception v1

    .line 7465
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, "DeviceListManager"

    const-string v4, "Exception: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public deleteAllLocationFromDB()V
    .locals 1

    .prologue
    .line 6937
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->deleteAllLocationFromDB()Z

    .line 6938
    return-void
.end method

.method public deleteDevicePresetCloud(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 6874
    const-string v1, "DeviceListManager"

    const-string v2, " :: deleteDevicePresetCloud :: is called"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6875
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 6876
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6877
    .local v0, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestForDelDevicePreset;

    invoke-direct {v1, p2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForDelDevicePreset;-><init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6883
    .end local v0    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 6880
    :cond_0
    const-string v1, "DeviceListManager"

    const-string v2, "JSONArray or SetAndGetActionCallBack is null "

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6881
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method

.method public deleteLocation(Ljava/lang/String;)V
    .locals 1
    .param p1, "locationHomeId"    # Ljava/lang/String;

    .prologue
    .line 6680
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->deleteLocationFromDB(Ljava/lang/String;)Z

    .line 6683
    return-void
.end method

.method public deviceAdded(Lorg/cybergarage/upnp/Device;)V
    .locals 11
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 2054
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    monitor-enter v10

    .line 2060
    :try_start_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v9

    .line 2061
    .local v9, "udn":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: MSearch Device Added Notification. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2063
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isCandidateForMSearchProcessing(Lorg/cybergarage/upnp/Device;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2065
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->msearchInProgressDeviceList:Ljava/util/List;

    invoke-interface {v1, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 2066
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: MSearch Device being processed. DO NOT PROCESS AGAIN. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2136
    :goto_0
    monitor-exit v10

    .line 2228
    return-void

    .line 2071
    :cond_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: MSearch FRESH DEVICE. STARTING MSearch PROCESSING. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2072
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->msearchInProgressDeviceList:Ljava/util/List;

    invoke-interface {v1, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 2073
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    new-instance v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;

    invoke-direct {v8, p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$18;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lorg/cybergarage/upnp/Device;)V

    move-object v3, p0

    move-object v7, p1

    invoke-direct/range {v0 .. v8}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;-><init>(Lcom/belkin/wemo/cache/CacheManager;Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/utils/SharePreferences;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;Landroid/content/Context;Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable$onMSearchDeviceProcessedListener;)V

    .line 2127
    .local v0, "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0

    .line 2136
    .end local v0    # "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/MSearchDeviceAddedRunnable;
    .end local v9    # "udn":Ljava/lang/String;
    :catchall_0
    move-exception v1

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 2134
    .restart local v9    # "udn":Ljava/lang/String;
    :cond_1
    :try_start_1
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Discovery: MSearch Device is NOT a candidate for processing. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0
.end method

.method public deviceDiscovered(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V
    .locals 11
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "deviceStr"    # Ljava/lang/String;

    .prologue
    .line 2606
    iget-object v10, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mutex:Ljava/lang/Object;

    monitor-enter v10

    .line 2607
    :try_start_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unicast Discovery: Device Discovered Via Unicast: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2609
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    move-object v3, p0

    move-object v4, p1

    move-object v6, p2

    invoke-direct/range {v0 .. v9}, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;-><init>(Lcom/belkin/wemo/cache/CacheManager;Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/ControlPoint;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V

    .line 2610
    .local v0, "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 2611
    monitor-exit v10

    .line 2677
    return-void

    .line 2611
    .end local v0    # "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDeviceDiscoveredRunnable;
    :catchall_0
    move-exception v1

    monitor-exit v10
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public deviceNotDiscovered(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "ip"    # Ljava/lang/String;
    .param p3, "port"    # I

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x1

    .line 2681
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unicast Discovery: Device NOT Discovered. UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; IP: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; PORT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2683
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v4

    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->onDeviceUnicastFailed(Ljava/lang/String;)V

    .line 2685
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v4, p1}, Lcom/belkin/wemo/cache/CacheManager;->getFullDeviceInfoFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 2687
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 2689
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v2

    .line 2690
    .local v2, "oldIP":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v3

    .line 2691
    .local v3, "oldPort":I
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_2

    invoke-virtual {v2, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    if-ne v3, p3, :cond_2

    .line 2692
    invoke-virtual {v0, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 2693
    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 2694
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, p1, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 2695
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 2697
    const-string v4, "update"

    const-string v5, ""

    invoke-virtual {p0, v4, v5, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2698
    const-string v4, "Discovery TimeOut"

    invoke-direct {p0, p1, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V

    .line 2701
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/IsDevice;->Bridge(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 2702
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onBridgeNotDiscovered(Ljava/lang/String;)V

    .line 2705
    :cond_0
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v4, v0, v7, v7, v7}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 2706
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 2708
    new-instance v1, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 2709
    .local v1, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v4, "cache.db"

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 2715
    .end local v1    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    .end local v2    # "oldIP":Ljava/lang/String;
    .end local v3    # "oldPort":I
    :cond_1
    :goto_0
    return-void

    .line 2712
    .restart local v2    # "oldIP":Ljava/lang/String;
    .restart local v3    # "oldPort":I
    :cond_2
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Unicast Discovery: Device NOT Discovered. IP/PORT have changed. OLD IP: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; OLD PORT: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public deviceRemoved(Lorg/cybergarage/upnp/Device;)V
    .locals 4
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 2752
    if-eqz p1, :cond_0

    .line 2753
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    .line 2754
    .local v0, "udn":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, " deviceRemoved notification for "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2756
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 2758
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v1

    if-nez v1, :cond_0

    .line 2759
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 2760
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FW Update: Device NOT Removed as BYE BYE packet received after possible FW upgrade: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2767
    .end local v0    # "udn":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 2763
    .restart local v0    # "udn":Ljava/lang/String;
    :cond_1
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public didUnicastFailForAnyDevice()Z
    .locals 1

    .prologue
    .line 7373
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->didUnicastFailForAnyDevice()Z

    move-result v0

    return v0
.end method

.method public disableCacheStat(Z)V
    .locals 1
    .param p1, "disable"    # Z

    .prologue
    .line 4241
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/CacheManager;->setDisableStat(Z)V

    .line 4242
    return-void
.end method

.method public enableForcedRemote()V
    .locals 3

    .prologue
    .line 7406
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setForcedRemoteEnabled(Z)V

    .line 7407
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 7408
    const-string v0, "set_remote"

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {p0, v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7409
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Enabling Forced Remote Feature. getSmartDiscovery().isForcedRemoteEnabled(): "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7410
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initCache()V

    .line 7411
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$28;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$28;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7417
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 7418
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V

    .line 7420
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v0, :cond_0

    .line 7421
    const-string v0, "DeviceListManager"

    const-string v1, "Stopping ControlPoint. "

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7422
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z

    .line 7423
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 7425
    :cond_0
    return-void
.end method

.method public eventNotifyReceived(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 39
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "seq"    # J
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "state"    # Ljava/lang/String;

    .prologue
    .line 1214
    const/16 v25, 0x1

    .line 1215
    .local v25, "isNotificationSent":Z
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Notification received: name:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " sid"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " state:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " ledDeviceId"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1216
    invoke-static/range {p5 .. p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v35

    if-nez v35, :cond_1

    .line 1217
    const-string v35, "overTemp"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_3

    .line 1218
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1219
    .local v19, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_2

    .line 1222
    :try_start_0
    const-string v35, "overTemp"

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 1226
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1227
    const-string v35, "update"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1228
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1541
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    :goto_1
    if-nez v25, :cond_1

    .line 1542
    const-string v35, "DeviceListManager"

    const-string v36, "Notification received from FW but not processed and sent to UI. Refreshing device list to renew subscription."

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1543
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startUnicastDiscovery()V

    .line 1546
    :cond_1
    :goto_2
    return-void

    .line 1223
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v21

    .line 1224
    .local v21, "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "JSONException while setting OverTemp as attribute in DeviceInfo: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 1230
    .end local v21    # "e":Lorg/json/JSONException;
    :cond_2
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device NOT FOUND: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1231
    const/16 v25, 0x0

    goto :goto_1

    .line 1233
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    const-string v35, "BinaryState"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_4

    const-string v35, "Brightness"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_4

    const-string v35, "Fader"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_c

    .line 1236
    :cond_4
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1237
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_b

    .line 1240
    const-string v35, "BinaryState"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_6

    .line 1241
    move-object/from16 v0, v19

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 1244
    :try_start_1
    const-string v35, "binaryState"

    const-string v36, "\\|"

    move-object/from16 v0, p6

    move-object/from16 v1, v36

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v36

    const/16 v37, 0x0

    aget-object v36, v36, v37

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1245
    const-string v35, "\\|"

    move-object/from16 v0, p6

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x0

    aget-object v35, v35, v36

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v35

    invoke-virtual/range {v35 .. v35}, Ljava/lang/Integer;->intValue()I

    move-result v35

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    .line 1252
    :goto_3
    const-string v35, "set_widget_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1271
    :cond_5
    :goto_4
    const-string v35, "Fader"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_a

    .line 1272
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v30

    .line 1273
    .local v30, "udn":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->binaryStateRequestTrackerMap:Ljava/util/Map;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    check-cast v29, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;

    .line 1274
    .local v29, "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    if-eqz v29, :cond_9

    .line 1275
    invoke-virtual/range {v29 .. v29}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->isRequestNotificationPending()Z

    move-result v35

    if-nez v35, :cond_8

    .line 1276
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1277
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1278
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_1

    .line 1246
    .end local v29    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    .end local v30    # "udn":Ljava/lang/String;
    :catch_1
    move-exception v22

    .line 1247
    .local v22, "ex":Ljava/lang/NumberFormatException;
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Unable to parse :"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, ": "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v22

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_3

    .line 1248
    .end local v22    # "ex":Ljava/lang/NumberFormatException;
    :catch_2
    move-exception v21

    .line 1249
    .restart local v21    # "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "JSONException while setting binaryState as attribute in DeviceInfo: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_3

    .line 1254
    .end local v21    # "e":Lorg/json/JSONException;
    :cond_6
    const-string v35, "Brightness"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_7

    .line 1257
    :try_start_2
    const-string v35, "brightness"

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_3

    goto/16 :goto_4

    .line 1258
    :catch_3
    move-exception v21

    .line 1259
    .restart local v21    # "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "JSONException while setting brightness as attribute in DeviceInfo: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_4

    .line 1261
    .end local v21    # "e":Lorg/json/JSONException;
    :cond_7
    const-string v35, "Fader"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_5

    .line 1264
    :try_start_3
    const-string v35, "fader"

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_4

    goto/16 :goto_4

    .line 1265
    :catch_4
    move-exception v21

    .line 1266
    .restart local v21    # "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "JSONException while setting fader as attribute in DeviceInfo: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_4

    .line 1280
    .end local v21    # "e":Lorg/json/JSONException;
    .restart local v29    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    .restart local v30    # "udn":Ljava/lang/String;
    :cond_8
    invoke-virtual/range {v29 .. v29}, Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;->onRequestNotificationReceived()V

    goto/16 :goto_1

    .line 1283
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1284
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1285
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_1

    .line 1288
    .end local v29    # "requestTracker":Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;
    .end local v30    # "udn":Ljava/lang/String;
    :cond_a
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "Sending FADER Notification for Device: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1289
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1290
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1291
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_1

    .line 1294
    :cond_b
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device NOT FOUND: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1295
    const/16 v25, 0x0

    goto/16 :goto_1

    .line 1298
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_c
    const-string v35, "endTime"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_d

    const-string v35, "nightModeBrightness"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_d

    const-string v35, "nightMode"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_d

    const-string v35, "startTime"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_f

    .line 1303
    :cond_d
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1304
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_e

    .line 1306
    :try_start_4
    move-object/from16 v0, v19

    move-object/from16 v1, p5

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_5

    .line 1310
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1311
    const-string v35, "update"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1312
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_1

    .line 1307
    :catch_5
    move-exception v21

    .line 1308
    .restart local v21    # "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "JSONException while setting Smart Brightness property as attribute in DeviceInfo: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_5

    .line 1314
    .end local v21    # "e":Lorg/json/JSONException;
    :cond_e
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1315
    const/16 v25, 0x0

    goto/16 :goto_1

    .line 1318
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_f
    const-string v35, "mode"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_10

    const-string v35, "time"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_10

    const-string v35, "cookedTime"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_12

    .line 1321
    :cond_10
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1322
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_11

    .line 1323
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v17

    .line 1326
    .local v17, "deviceAttributes":Lorg/json/JSONObject;
    :try_start_5
    move-object/from16 v0, v17

    move-object/from16 v1, p5

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v32

    check-cast v32, Lorg/json/JSONObject;

    .line 1327
    .local v32, "valObject":Lorg/json/JSONObject;
    const-string v35, "value"

    move-object/from16 v0, v32

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1328
    move-object/from16 v0, v17

    move-object/from16 v1, p5

    move-object/from16 v2, v32

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_6

    .line 1333
    .end local v32    # "valObject":Lorg/json/JSONObject;
    :goto_6
    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 1334
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1335
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1336
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1329
    :catch_6
    move-exception v21

    .line 1331
    .restart local v21    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_6

    .line 1338
    .end local v17    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v21    # "e":Lorg/json/JSONException;
    :cond_11
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1339
    const/16 v25, 0x0

    goto/16 :goto_1

    .line 1341
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_12
    const-string v35, "StatusChange"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-nez v35, :cond_13

    const-string v35, "SensorChange"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_1b

    .line 1342
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1343
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_19

    .line 1344
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device info :"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1345
    move-object/from16 v0, p0

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceCapabilities(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v10

    .line 1347
    .local v10, "capabilitiesList":Ljava/lang/String;
    invoke-virtual {v10}, Ljava/lang/String;->isEmpty()Z

    move-result v35

    if-nez v35, :cond_18

    invoke-static/range {p6 .. p6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v35

    if-nez v35, :cond_18

    .line 1350
    :try_start_6
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v10}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1351
    .local v9, "capabilities":Lorg/json/JSONObject;
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "capabilities JSONObject:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1352
    const-string v35, "::"

    move-object/from16 v0, p6

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v34

    .line 1353
    .local v34, "values":[Ljava/lang/String;
    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v35, v0

    if-eqz v35, :cond_0

    .line 1354
    const/16 v35, 0x2

    aget-object v7, v34, v35

    .line 1355
    .local v7, "availability":Ljava/lang/String;
    const-string v35, "YES"

    move-object/from16 v0, v35

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_17

    .line 1356
    const-string v35, "DeviceListManager"

    const-string v36, "capabilities JSONObject: IF"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1357
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-eqz v35, :cond_14

    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual/range {v35 .. v35}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v35

    if-eqz v35, :cond_15

    .line 1358
    :cond_14
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 1359
    :cond_15
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const/16 v36, 0x1

    aget-object v36, v34, v36

    invoke-virtual/range {v35 .. v36}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 1360
    .local v11, "capabilityID":Ljava/lang/String;
    const/16 v35, 0x0

    aget-object v35, v34, v35

    move-object/from16 v0, v35

    invoke-virtual {v9, v11, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1361
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "updating capability:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, " value:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const/16 v37, 0x0

    aget-object v37, v34, v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1362
    invoke-virtual {v9}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v35

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 1363
    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v35, v0
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_7

    const/16 v36, 0x3

    move/from16 v0, v35

    move/from16 v1, v36

    if-le v0, v1, :cond_16

    .line 1365
    const/16 v35, 0x3

    :try_start_7
    aget-object v35, v34, v35

    invoke-static/range {v35 .. v35}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v35

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setStatusTS(I)V
    :try_end_7
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_8
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    .line 1371
    :cond_16
    :goto_7
    const/16 v35, 0x1

    :try_start_8
    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 1372
    const/16 v35, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 1373
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1374
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1375
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_7

    goto/16 :goto_1

    .line 1387
    .end local v7    # "availability":Ljava/lang/String;
    .end local v9    # "capabilities":Lorg/json/JSONObject;
    .end local v11    # "capabilityID":Ljava/lang/String;
    .end local v34    # "values":[Ljava/lang/String;
    :catch_7
    move-exception v21

    .line 1388
    .restart local v21    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 1367
    .end local v21    # "e":Lorg/json/JSONException;
    .restart local v7    # "availability":Ljava/lang/String;
    .restart local v9    # "capabilities":Lorg/json/JSONObject;
    .restart local v11    # "capabilityID":Ljava/lang/String;
    .restart local v34    # "values":[Ljava/lang/String;
    :catch_8
    move-exception v21

    .line 1368
    .local v21, "e":Ljava/lang/NumberFormatException;
    :try_start_9
    const-string v35, "DeviceListManager"

    const-string v36, "Number parsing exception: "

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_7

    .line 1376
    .end local v11    # "capabilityID":Ljava/lang/String;
    .end local v21    # "e":Ljava/lang/NumberFormatException;
    :cond_17
    const-string v35, "NO"

    move-object/from16 v0, v35

    invoke-virtual {v7, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_0

    .line 1377
    const-string v35, "DeviceListManager"

    const-string v36, "capabilities JSONObject: ELSE flase"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1378
    const/16 v35, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 1379
    const/16 v35, 0x1

    move-object/from16 v0, v19

    move/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 1380
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1381
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1382
    const-string v35, "update"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_9
    .catch Lorg/json/JSONException; {:try_start_9 .. :try_end_9} :catch_7

    goto/16 :goto_1

    .line 1391
    .end local v7    # "availability":Ljava/lang/String;
    .end local v9    # "capabilities":Lorg/json/JSONObject;
    .end local v34    # "values":[Ljava/lang/String;
    :cond_18
    const-string v35, "DeviceListManager"

    const-string v36, "capabilities or state is empty:"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1395
    .end local v10    # "capabilitiesList":Ljava/lang/String;
    :cond_19
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found try getting grouped devices:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1396
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    move-object/from16 v0, v35

    move-object/from16 v1, p2

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/CacheManager;->getDevicesForGroup(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v23

    .line 1397
    .local v23, "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "grouped devices:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1399
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->size()I

    move-result v35

    if-lez v35, :cond_0

    .line 1400
    const-string v35, "::"

    move-object/from16 v0, p6

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v34

    .line 1401
    .restart local v34    # "values":[Ljava/lang/String;
    invoke-virtual/range {v23 .. v23}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v24

    .local v24, "i$":Ljava/util/Iterator;
    :goto_8
    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_1a

    invoke-interface/range {v24 .. v24}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v27

    check-cast v27, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1402
    .local v27, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual/range {v27 .. v27}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v35

    const/16 v36, 0x1

    aget-object v36, v34, v36

    const/16 v37, 0x0

    aget-object v37, v34, v37

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    move-object/from16 v3, v37

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateZigbeeCapability(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1403
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "updated cache and db for :"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v27 .. v27}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v37

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_8

    .line 1405
    .end local v27    # "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1a
    new-instance v12, Lorg/json/JSONObject;

    invoke-direct {v12}, Lorg/json/JSONObject;-><init>()V

    .line 1407
    .local v12, "capabilityValues":Lorg/json/JSONObject;
    :try_start_a
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    const/16 v36, 0x1

    aget-object v36, v34, v36

    invoke-virtual/range {v35 .. v36}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v35

    check-cast v35, Ljava/lang/String;

    const/16 v36, 0x0

    aget-object v36, v34, v36

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-virtual {v12, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1408
    new-instance v18, Lorg/json/JSONObject;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONObject;-><init>()V

    .line 1409
    .local v18, "deviceCapabilities":Lorg/json/JSONObject;
    const-string v35, "deviceCapabilities"

    move-object/from16 v0, v18

    move-object/from16 v1, v35

    invoke-virtual {v0, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1410
    const-string v35, "update_group_state"

    invoke-virtual/range {v18 .. v18}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    move-object/from16 v3, p2

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_a
    .catch Lorg/json/JSONException; {:try_start_a .. :try_end_a} :catch_9

    goto/16 :goto_1

    .line 1411
    .end local v18    # "deviceCapabilities":Lorg/json/JSONObject;
    :catch_9
    move-exception v21

    .line 1412
    .local v21, "e":Lorg/json/JSONException;
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 1417
    .end local v12    # "capabilityValues":Lorg/json/JSONObject;
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v21    # "e":Lorg/json/JSONException;
    .end local v23    # "groupedLEDList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v24    # "i$":Ljava/util/Iterator;
    .end local v34    # "values":[Ljava/lang/String;
    :cond_1b
    const-string v35, "attributeList"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_1f

    .line 1418
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1419
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_1e

    .line 1420
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device info :"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1421
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v13

    .line 1424
    .local v13, "currentAttributeList":Lorg/json/JSONObject;
    :try_start_b
    new-instance v35, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;

    invoke-direct/range {v35 .. v35}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;-><init>()V

    move-object/from16 v0, v35

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/parser/GetAttributeResponseParser;->parseGetAttributeResponse(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v31

    .line 1425
    .local v31, "updatedAttributeList":Lorg/json/JSONObject;
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "updatedAttributeList:"

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v31

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1426
    if-eqz v31, :cond_0

    .line 1427
    invoke-virtual/range {v31 .. v31}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v26

    .line 1428
    .local v26, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_1c
    :goto_9
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->hasNext()Z

    move-result v35

    if-eqz v35, :cond_1d

    .line 1429
    invoke-interface/range {v26 .. v26}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 1430
    .local v6, "attributeKey":Ljava/lang/String;
    invoke-virtual {v13, v6}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_1c

    .line 1431
    move-object/from16 v0, v31

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v35

    move-object/from16 v0, v35

    invoke-virtual {v13, v6, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_b
    .catch Lorg/json/JSONException; {:try_start_b .. :try_end_b} :catch_a
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_b

    goto :goto_9

    .line 1439
    .end local v6    # "attributeKey":Ljava/lang/String;
    .end local v26    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v31    # "updatedAttributeList":Lorg/json/JSONObject;
    :catch_a
    move-exception v21

    .line 1441
    .restart local v21    # "e":Lorg/json/JSONException;
    invoke-virtual/range {v21 .. v21}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 1434
    .end local v21    # "e":Lorg/json/JSONException;
    .restart local v26    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v31    # "updatedAttributeList":Lorg/json/JSONObject;
    :cond_1d
    :try_start_c
    move-object/from16 v0, v19

    invoke-virtual {v0, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 1435
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1436
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1437
    const-string v35, "change_state"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catch Lorg/json/JSONException; {:try_start_c .. :try_end_c} :catch_a
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_b

    goto/16 :goto_1

    .line 1442
    .end local v26    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v31    # "updatedAttributeList":Lorg/json/JSONObject;
    :catch_b
    move-exception v22

    .line 1443
    .local v22, "ex":Ljava/lang/Exception;
    invoke-virtual/range {v22 .. v22}, Ljava/lang/Exception;->printStackTrace()V

    goto/16 :goto_1

    .line 1446
    .end local v13    # "currentAttributeList":Lorg/json/JSONObject;
    .end local v22    # "ex":Ljava/lang/Exception;
    :cond_1e
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1447
    const/16 v25, 0x0

    goto/16 :goto_1

    .line 1449
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1f
    const-string v35, "FirmwareUpdateStatus"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_24

    .line 1450
    const-string v35, "DeviceListManager"

    const-string v36, " UpnpConstants.NOTIFICATION_FIRMWARE_STATUS :"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1451
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1452
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_23

    .line 1453
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v30

    .line 1454
    .restart local v30    # "udn":Ljava/lang/String;
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "FW Update: NOTIFICATION_FIRMWARE_STATUS received for UDN: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "; status: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1457
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v30

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;

    .line 1461
    .local v16, "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    const-string v35, "4"

    move-object/from16 v0, p6

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-eqz v35, :cond_20

    if-nez v16, :cond_20

    .line 1463
    const-string v35, "DeviceListManager"

    const-string v36, "FW Update: Notification NOT for a device in update process."

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1491
    :goto_a
    const-string v35, "DeviceListManager"

    const-string v36, "FW Update: fwUpdateInProgressDataMap: Notification received for NOTIFICATION_FIRMWARE_STATUS"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1492
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 1493
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x1

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1494
    const-string v35, "FirmwareUpdateStatus"

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1466
    :cond_20
    if-nez v16, :cond_21

    .line 1467
    new-instance v16, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;

    .end local v16    # "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    invoke-direct/range {v16 .. v16}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;-><init>()V

    .line 1468
    .restart local v16    # "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    move-object/from16 v0, v16

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setUdn(Ljava/lang/String;)V

    .line 1469
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v28

    .line 1470
    .local v28, "oldFWVersion":Ljava/lang/String;
    move-object/from16 v0, v16

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setOldFwVersion(Ljava/lang/String;)V

    .line 1471
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "FW Update: Adding to fwUpdateInProgressDataMap. UDN: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v30

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    const-string v37, "old FW Version: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, v28

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1472
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v30

    move-object/from16 v2, v16

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1475
    .end local v28    # "oldFWVersion":Ljava/lang/String;
    :cond_21
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v14

    .line 1476
    .local v14, "currentStatusTS":J
    const-string v35, "1"

    move-object/from16 v0, p6

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v35

    if-eqz v35, :cond_22

    .line 1477
    const-string v35, "DeviceListManager"

    const-string v36, "FW Update: FW_STATUS_DOWNLOAD_COMPLETED received and IGNORED"

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2

    .line 1487
    :cond_22
    move-object/from16 v0, v16

    invoke-virtual {v0, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setStatusTS(J)V

    .line 1488
    move-object/from16 v0, v16

    move-object/from16 v1, p6

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setFwStatus(Ljava/lang/String;)V

    goto/16 :goto_a

    .line 1497
    .end local v14    # "currentStatusTS":J
    .end local v16    # "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    .end local v30    # "udn":Ljava/lang/String;
    :cond_23
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1500
    .end local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_24
    const-string v35, "SubDeviceFWUpdate"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_25

    .line 1501
    const-string v35, "::"

    move-object/from16 v0, p2

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v34

    .line 1502
    .restart local v34    # "values":[Ljava/lang/String;
    if-eqz v34, :cond_0

    move-object/from16 v0, v34

    array-length v0, v0

    move/from16 v35, v0

    const/16 v36, 0x1

    move/from16 v0, v35

    move/from16 v1, v36

    if-lt v0, v1, :cond_0

    const/16 v35, 0x1

    aget-object v35, v34, v35

    const-string v36, "FWUpdateStatus"

    invoke-virtual/range {v35 .. v36}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_0

    .line 1503
    const/16 v35, 0x0

    aget-object v30, v34, v35

    .line 1504
    .restart local v30    # "udn":Ljava/lang/String;
    const-string v35, "SubDeviceFWUpdate"

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    move-object/from16 v3, v30

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 1505
    move-object/from16 v0, p0

    move-object/from16 v1, v30

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInfoBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v20

    .line 1506
    .local v20, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v20, :cond_0

    .line 1507
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x1

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v20

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto/16 :goto_1

    .line 1510
    .end local v20    # "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v30    # "udn":Ljava/lang/String;
    .end local v34    # "values":[Ljava/lang/String;
    :cond_25
    const-string v35, "CountdownEndTime"

    move-object/from16 v0, p5

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_0

    .line 1511
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v19

    .line 1513
    .restart local v19    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v19, :cond_27

    .line 1514
    new-instance v33, Lorg/json/JSONObject;

    invoke-direct/range {v33 .. v33}, Lorg/json/JSONObject;-><init>()V

    .line 1515
    .local v33, "value":Lorg/json/JSONObject;
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8}, Lorg/json/JSONObject;-><init>()V

    .line 1516
    .local v8, "bsValue":Lorg/json/JSONObject;
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v17

    .line 1518
    .restart local v17    # "deviceAttributes":Lorg/json/JSONObject;
    :try_start_d
    const-string v35, "value"

    move-object/from16 v0, v33

    move-object/from16 v1, v35

    move-object/from16 v2, p6

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1519
    const-string v35, "name"

    const-string v36, "RuleAutoOffTime"

    move-object/from16 v0, v33

    move-object/from16 v1, v35

    move-object/from16 v2, v36

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1520
    const-string v35, "RuleAutoOffTime"

    move-object/from16 v0, v17

    move-object/from16 v1, v35

    move-object/from16 v2, v33

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1522
    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v35

    invoke-static/range {v35 .. v35}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v35

    if-eqz v35, :cond_26

    .line 1523
    const-string v35, "value"

    const-string v36, "1"

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    invoke-virtual {v8, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1524
    const-string v35, "binaryState"

    move-object/from16 v0, v17

    move-object/from16 v1, v35

    invoke-virtual {v0, v1, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 1525
    const-string v35, "1"

    move-object/from16 v0, v19

    move-object/from16 v1, v35

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V
    :try_end_d
    .catch Lorg/json/JSONException; {:try_start_d .. :try_end_d} :catch_c

    .line 1531
    :cond_26
    :goto_b
    move-object/from16 v0, v19

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 1532
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v35, v0

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 1533
    sget-object v35, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v36, 0x0

    const/16 v37, 0x0

    const/16 v38, 0x1

    move-object/from16 v0, v35

    move-object/from16 v1, v19

    move/from16 v2, v36

    move/from16 v3, v37

    move/from16 v4, v38

    invoke-virtual {v0, v1, v2, v3, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 1534
    const-string v35, "update"

    invoke-virtual/range {v19 .. v19}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v36

    move-object/from16 v0, p0

    move-object/from16 v1, v35

    move-object/from16 v2, p2

    move-object/from16 v3, v36

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_1

    .line 1528
    :catch_c
    move-exception v21

    .line 1529
    .restart local v21    # "e":Lorg/json/JSONException;
    const-string v35, "DeviceListManager"

    const-string v36, "Json Exception on countdown time"

    move-object/from16 v0, v35

    move-object/from16 v1, v36

    move-object/from16 v2, v21

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_b

    .line 1536
    .end local v8    # "bsValue":Lorg/json/JSONObject;
    .end local v17    # "deviceAttributes":Lorg/json/JSONObject;
    .end local v21    # "e":Lorg/json/JSONException;
    .end local v33    # "value":Lorg/json/JSONObject;
    :cond_27
    const-string v35, "DeviceListManager"

    new-instance v36, Ljava/lang/StringBuilder;

    invoke-direct/range {v36 .. v36}, Ljava/lang/StringBuilder;-><init>()V

    const-string v37, "device not found: "

    invoke-virtual/range {v36 .. v37}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    move-object/from16 v0, v36

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v36

    invoke-virtual/range {v36 .. v36}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v36

    invoke-static/range {v35 .. v36}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1537
    const/16 v25, 0x0

    goto/16 :goto_1
.end method

.method public fetchSensorEventHistory(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V
    .locals 3
    .param p1, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p2, "jsonArray"    # Lorg/json/JSONArray;

    .prologue
    .line 6811
    const-string v1, "DeviceListManager"

    const-string v2, " :: fetchSensorEventHistory :: is called"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6812
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6813
    .local v0, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2, p1, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSensorEvent;-><init>(Landroid/content/Context;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6814
    return-void
.end method

.method public fetchSensorEventHistoryFromDB()Lorg/json/JSONArray;
    .locals 2

    .prologue
    .line 6818
    const-string v0, "DeviceListManager"

    const-string v1, " :: fetchSensorEventHistoryFromDB :: is called"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6819
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/CacheManager;->getSenosrEventsFromDB()Lorg/json/JSONArray;

    move-result-object v0

    return-object v0
.end method

.method public findLedBulb(Ljava/lang/String;)Lorg/json/JSONArray;
    .locals 11
    .param p1, "ledDeviceId"    # Ljava/lang/String;

    .prologue
    .line 7324
    new-instance v7, Lorg/json/JSONArray;

    invoke-direct {v7}, Lorg/json/JSONArray;-><init>()V

    .line 7326
    .local v7, "responseJsonArray":Lorg/json/JSONArray;
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 7327
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const-string v5, ""

    .line 7328
    .local v5, "mBridgeUdn":Ljava/lang/String;
    if-eqz v1, :cond_2

    .line 7329
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_0
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v8

    if-ge v4, v8, :cond_1

    .line 7330
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Bridge"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 7331
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v8

    invoke-virtual {v8, v4}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v8}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v5

    .line 7329
    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 7334
    :cond_1
    const-string v8, "DeviceListManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "bridge udn if:---"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v10

    invoke-virtual {v10}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "--"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7337
    .end local v4    # "i":I
    :cond_2
    if-eqz v5, :cond_3

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    if-eqz v8, :cond_3

    .line 7338
    invoke-virtual {v1, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v8

    const-string v9, "IdentifyDevice"

    invoke-virtual {v8, v9}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 7339
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v8, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_DEVICEID:[Ljava/lang/String;

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    aput-object p1, v9, v10

    invoke-virtual {p0, v0, v8, v9}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 7340
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v6

    .line 7341
    .local v6, "response":Ljava/lang/String;
    const-string v8, "DeviceListManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "FIND BULB RESPOMSE: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7342
    if-eqz v6, :cond_3

    .line 7343
    new-instance v2, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;-><init>()V

    .line 7344
    .local v2, "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    invoke-virtual {v2, v6}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 7351
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    .end local v5    # "mBridgeUdn":Ljava/lang/String;
    .end local v6    # "response":Ljava/lang/String;
    :cond_3
    :goto_1
    return-object v7

    .line 7347
    :catch_0
    move-exception v3

    .line 7348
    .local v3, "e":Ljava/lang/Exception;
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method public generateEditedIconFile()Ljava/io/File;
    .locals 3

    .prologue
    .line 6489
    :try_start_0
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v2}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v2

    invoke-virtual {v2}, Lcom/belkin/wemo/storage/FileStorage;->getEditedIconFile()Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 6493
    :goto_0
    return-object v1

    .line 6491
    :catch_0
    move-exception v0

    .line 6492
    .local v0, "ex":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6493
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getActiveDeviceInfoList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 3861
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getActiveDeviceInfoList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getAvgDiscoverySpeedByUDN(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "zigbee"    # Z

    .prologue
    const/4 v4, 0x0

    .line 4253
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v5, p1, v3, p2}, Lcom/belkin/wemo/cache/CacheManager;->getAvgDiscoveryTime(Ljava/lang/String;ZZ)I

    move-result v1

    .line 4255
    .local v1, "result":I
    div-int/lit16 v2, v1, 0x3e8

    .line 4256
    .local v2, "sec":I
    rem-int/lit16 v3, v1, 0x3e8

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    .line 4257
    .local v0, "ms":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v5, 0x3

    if-le v3, v5, :cond_0

    .line 4258
    const/4 v3, 0x2

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 4259
    :cond_0
    if-lez v2, :cond_2

    .line 4260
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 4262
    :goto_1
    return-object v3

    .end local v0    # "ms":Ljava/lang/String;
    .end local v1    # "result":I
    .end local v2    # "sec":I
    :cond_1
    move v3, v4

    .line 4253
    goto :goto_0

    .line 4262
    .restart local v0    # "ms":Ljava/lang/String;
    .restart local v1    # "result":I
    .restart local v2    # "sec":I
    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "0:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_1
.end method

.method public getBinaryStateRequestTrackerMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceRequestTracker;",
            ">;"
        }
    .end annotation

    .prologue
    .line 480
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->binaryStateRequestTrackerMap:Ljava/util/Map;

    return-object v0
.end method

.method public getBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 20
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 5911
    const/16 v19, 0x0

    .line 5912
    .local v19, "isProcessing":Z
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5913
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "missing UDN udn: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5914
    const/4 v1, 0x0

    .line 5933
    :goto_0
    return v1

    .line 5918
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5919
    new-instance v3, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v1}, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;-><init>(Landroid/content/Context;)V

    .line 5920
    .local v3, "callback":Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 5921
    .local v7, "localDevice":Lorg/cybergarage/upnp/Device;
    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    const-string v2, "getBlobStorage"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    invoke-direct/range {v1 .. v7}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lorg/json/JSONObject;Lorg/cybergarage/upnp/Device;)V

    invoke-static {v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 5922
    const/16 v19, 0x1

    .end local v3    # "callback":Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    .end local v7    # "localDevice":Lorg/cybergarage/upnp/Device;
    :goto_1
    move/from16 v1, v19

    .line 5933
    goto :goto_0

    .line 5924
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v17

    .line 5925
    .local v17, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v16, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v16

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 5926
    .local v16, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;

    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v13

    const-string v14, "getBlobStorage"

    move-object/from16 v9, p0

    move-object/from16 v11, p1

    move-object/from16 v15, p2

    invoke-direct/range {v8 .. v15}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 5929
    .end local v16    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v17    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v18

    .line 5930
    .local v18, "ex":Ljava/lang/Exception;
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in getBlobStorage udn: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public getBridgeDataFromBridgeUDN(Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 6
    .param p1, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 5887
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 5889
    .local v0, "bridgeData":Lorg/json/JSONObject;
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 5890
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-nez v3, :cond_0

    .line 5891
    const-string v3, "bridgeudn"

    invoke-virtual {v0, v3, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 5892
    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-virtual {p0, p1, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 5893
    .local v1, "bridgeDevInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v3, "bridgeMacAddress"

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 5894
    const-string v3, "bridgePluginId"

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 5900
    .end local v1    # "bridgeDevInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    :goto_0
    return-object v0

    .line 5897
    :catch_0
    move-exception v2

    .line 5898
    .local v2, "ex":Ljava/lang/Exception;
    const-string v3, "DeviceListManager"

    const-string v4, "Exception in getBridgeMACFromBridgeUDN ex:"

    invoke-static {v3, v4, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public getBridgeUdn(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Ljava/lang/String;
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "controlPoint"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 5963
    const-string v1, ""

    .line 5964
    .local v1, "tempBridgeUdn":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {p2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 5965
    invoke-virtual {p2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    const-string v3, "Bridge"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5966
    invoke-virtual {p2}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v2

    invoke-virtual {v2, v0}, Lorg/cybergarage/upnp/DeviceList;->getDevice(I)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v1

    .line 5964
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 5969
    :cond_1
    return-object v1
.end method

.method public getCacheHitByUDN(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "zigbee"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 4292
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-nez v2, :cond_0

    move v2, v3

    :goto_0
    invoke-virtual {v5, p1, v2, p2}, Lcom/belkin/wemo/cache/CacheManager;->getCacheHit(Ljava/lang/String;ZZ)D

    move-result-wide v0

    .line 4294
    .local v0, "hit":D
    const-string v2, "%.2f"

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object v5

    aput-object v5, v3, v4

    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    return-object v2

    .end local v0    # "hit":D
    :cond_0
    move v2, v4

    .line 4292
    goto :goto_0
.end method

.method public getCurrentSSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 822
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    return-object v0
.end method

.method public getDWSensorListFromDb()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 7246
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getDWSensorList()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 7249
    :goto_0
    return-object v1

    .line 7247
    :catch_0
    move-exception v0

    .line 7248
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "Exception in getting FobSensorListFromDb "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 7249
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public getDataStoreFromCloud(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;)V
    .locals 7
    .param p1, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p2, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 6886
    const-string v4, "DeviceListManager"

    const-string v5, " :: getDataStoreFromCloud :: is called"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6887
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 6889
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 6890
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v2

    .line 6891
    .local v2, "pluginID":Ljava/lang/String;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    .line 6892
    .local v1, "mac":Ljava/lang/String;
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "pluginID:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " mac:: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6893
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 6894
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6895
    .local v3, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDataStoreOnLink;

    invoke-direct {v4, p1, p2, v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDataStoreOnLink;-><init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6906
    .end local v1    # "mac":Ljava/lang/String;
    .end local v2    # "pluginID":Ljava/lang/String;
    .end local v3    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 6898
    .restart local v1    # "mac":Ljava/lang/String;
    .restart local v2    # "pluginID":Ljava/lang/String;
    :cond_0
    const-string v4, "DeviceListManager"

    const-string v5, "Plugin and mac is empty"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6899
    invoke-interface {p1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 6903
    .end local v1    # "mac":Ljava/lang/String;
    .end local v2    # "pluginID":Ljava/lang/String;
    :cond_1
    const-string v4, "DeviceListManager"

    const-string v5, "No device Information is found"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6904
    invoke-interface {p1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method

.method public getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4400
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 4401
    const/4 v0, 0x0

    .line 4403
    :goto_0
    return-object v0

    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    goto :goto_0
.end method

.method public getDeviceByMACFromDB(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 3
    .param p1, "mac"    # Ljava/lang/String;

    .prologue
    .line 4407
    const/4 v0, 0x0

    .line 4408
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 4409
    const-string v1, "DeviceListManager"

    const-string v2, "getDeviceByMAC: MAC Address is empty."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4413
    :goto_0
    return-object v0

    .line 4411
    :cond_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceInformationByMAC(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    goto :goto_0
.end method

.method public getDeviceCapabilities(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;
    .locals 15
    .param p1, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 512
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v2

    .line 514
    .local v2, "capabilitiesList":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_2

    .line 516
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 518
    .local v1, "capabilitiesJsonObj":Lorg/json/JSONObject;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilityID()Ljava/lang/String;

    move-result-object v4

    .line 519
    .local v4, "capabilityIDList":Ljava/lang/String;
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCurrentState()Ljava/lang/String;

    move-result-object v8

    .line 521
    .local v8, "currentStateList":Ljava/lang/String;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ZIGBEE Capabilities. ID List: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; current state List: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 522
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_1

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v12

    if-nez v12, :cond_1

    .line 523
    const-string v12, ","

    const/4 v13, -0x1

    invoke-virtual {v4, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .line 524
    .local v0, "capabilitiesArr":[Ljava/lang/String;
    const-string v12, ","

    const/4 v13, -0x1

    invoke-virtual {v8, v12, v13}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v7

    .line 526
    .local v7, "currentStateArr":[Ljava/lang/String;
    array-length v11, v0

    .line 527
    .local v11, "length":I
    array-length v12, v7

    if-ne v11, v12, :cond_0

    .line 529
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_0
    if-ge v10, v11, :cond_1

    .line 530
    aget-object v3, v0, v10

    .line 531
    .local v3, "capabilityID":Ljava/lang/String;
    aget-object v6, v7, v10

    .line 533
    .local v6, "currentState":Ljava/lang/String;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "ZIGBEE Capabilities. ID: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "; current state: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 534
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v12, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 536
    .local v5, "capabilityStr":Ljava/lang/String;
    :try_start_0
    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 529
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    .line 537
    :catch_0
    move-exception v9

    .line 538
    .local v9, "e":Lorg/json/JSONException;
    const-string v12, "DeviceListManager"

    const-string v13, "JSONException while setting capabilities JSON: "

    invoke-static {v12, v13, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 542
    .end local v3    # "capabilityID":Ljava/lang/String;
    .end local v5    # "capabilityStr":Ljava/lang/String;
    .end local v6    # "currentState":Ljava/lang/String;
    .end local v9    # "e":Lorg/json/JSONException;
    .end local v10    # "i":I
    :cond_0
    const-string v12, "DeviceListManager"

    const-string v13, "NO KEY"

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 545
    .end local v0    # "capabilitiesArr":[Ljava/lang/String;
    .end local v7    # "currentStateArr":[Ljava/lang/String;
    .end local v11    # "length":I
    :cond_1
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    .line 547
    .end local v1    # "capabilitiesJsonObj":Lorg/json/JSONObject;
    .end local v4    # "capabilityIDList":Ljava/lang/String;
    .end local v8    # "currentStateList":Ljava/lang/String;
    :cond_2
    return-object v2
.end method

.method public getDeviceForWidget(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 551
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateLocalMode()V

    .line 552
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 553
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_2

    .line 554
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_3

    .line 555
    .local v3, "isLED":Z
    :goto_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_5

    if-nez v3, :cond_5

    .line 557
    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-nez v4, :cond_0

    .line 558
    new-instance v4, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v4}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 559
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {p0, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Lorg/cybergarage/upnp/ControlPoint;->setSSID(Ljava/lang/String;)V

    .line 561
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v4}, Lorg/cybergarage/upnp/ControlPoint;->start()Z

    .line 562
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v7

    invoke-static {v6, v7, p1}, Lcom/belkin/wemo/cache/utils/WemoUtils;->createSSDPPacket(Ljava/lang/String;ILjava/lang/String;)Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v6

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v4, v6, v7, v8}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;ZZ)V

    .line 563
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v4, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 565
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v1, :cond_4

    .line 566
    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 581
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    if-eqz v3, :cond_7

    .line 582
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceForWidget(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v4

    if-nez v4, :cond_6

    .line 583
    const-string v4, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "getDeviceForWidget - Failed to retrieve bridge device with UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v5

    .line 592
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "isLED":Z
    :cond_2
    :goto_1
    return-object v0

    .restart local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_3
    move v3, v4

    .line 554
    goto :goto_0

    .line 568
    .restart local v1    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v3    # "isLED":Z
    :cond_4
    :try_start_1
    const-string v4, "DeviceListManager"

    const-string v6, "getDeviceForWidget - Failed to retrieve ControlPoint Device"

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-object v0, v5

    .line 569
    goto :goto_1

    .line 571
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    :catch_0
    move-exception v2

    .line 572
    .local v2, "e":Ljava/lang/Exception;
    const-string v4, "DeviceListManager"

    const-string v6, "getDeviceForWidget - Exception while trying to start the ControlPoint: "

    invoke-static {v4, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    move-object v0, v5

    .line 573
    goto :goto_1

    .line 575
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_5
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v4

    if-nez v4, :cond_1

    .line 576
    const-string v4, "DeviceListManager"

    const-string v6, "getDeviceForWidget - Remote is not enabled on a remote connection"

    invoke-static {v4, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move-object v0, v5

    .line 577
    goto :goto_1

    .line 586
    :cond_6
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_7

    .line 587
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceCapabilities(Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 590
    :cond_7
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_1
.end method

.method public getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 8
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "localTable"    # Z
    .param p3, "remoteTable"    # Z
    .param p4, "devicesTable"    # Z

    .prologue
    .line 4123
    const/4 v1, 0x0

    .line 4125
    .local v1, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz p2, :cond_1

    .line 4126
    :try_start_0
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 4128
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 4129
    move-object v1, v0

    goto :goto_0

    .line 4132
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_1
    if-eqz p3, :cond_3

    .line 4133
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 4135
    .restart local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 4136
    move-object v1, v0

    goto :goto_1

    .line 4139
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_3
    if-eqz p4, :cond_5

    .line 4140
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-virtual {v4, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .restart local v3    # "i$":Ljava/util/Iterator;
    :cond_4
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 4142
    .restart local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v4

    if-eqz v4, :cond_4

    .line 4143
    move-object v1, v0

    goto :goto_2

    .line 4147
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v2

    .line 4148
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    .line 4150
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_5
    return-object v1
.end method

.method public getDeviceInformation()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4200
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationArrayList()Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformation(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/devicelist/WeMoDevice;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4229
    .local p1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/devicelist/WeMoDevice;>;"
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 4230
    .local v3, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    .line 4231
    .local v0, "device":Lcom/belkin/wemo/cache/devicelist/WeMoDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 4232
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v2

    .line 4234
    .local v2, "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 4237
    .end local v0    # "device":Lcom/belkin/wemo/cache/devicelist/WeMoDevice;
    .end local v2    # "info":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    return-object v3
.end method

.method public declared-synchronized getDeviceInformationBySID(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 7
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 7001
    monitor-enter p0

    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 7003
    .local v3, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 7004
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/util/Map$Entry;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 7005
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "device in DevicesArray: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7006
    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const-string v5, "WEMO00"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    .line 7007
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 7008
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    if-nez v2, :cond_2

    .line 7010
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v4

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 7011
    if-nez v2, :cond_1

    .line 7012
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceInformationByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 7013
    .local v0, "dbDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v0, v4}, Lcom/belkin/wemo/cache/utils/WemoUtils;->recreateControlPointDevice(Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/content/Context;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 7014
    const/4 v4, 0x0

    invoke-virtual {v1, v2, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setDevice(Lorg/cybergarage/upnp/Device;Z)V

    .line 7017
    .end local v0    # "dbDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    if-eqz v2, :cond_2

    .line 7018
    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    .line 7021
    :cond_2
    if-eqz v2, :cond_4

    .line 7022
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/Device;->getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 7023
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "device subscribed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7034
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    :goto_1
    monitor-exit p0

    return-object v1

    .line 7026
    .restart local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "device":Lorg/cybergarage/upnp/Device;
    :cond_3
    :try_start_1
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "device not subscribed: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 7001
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    .end local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :catchall_0
    move-exception v4

    monitor-exit p0

    throw v4

    .line 7029
    .restart local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v3    # "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;>;"
    :cond_4
    :try_start_2
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "device not found in control point for UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto/16 :goto_0

    .line 7034
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    :cond_5
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public getDeviceInformationByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4304
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4300
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationFromDB(ZZZ)Ljava/util/ArrayList;
    .locals 1
    .param p1, "localTable"    # Z
    .param p2, "remoteTable"    # Z
    .param p3, "devicesTable"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4392
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4396
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/CacheManager;->getFullDeviceInfoFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 6624
    new-instance v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;-><init>()V

    .line 6625
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 6626
    return-object v0
.end method

.method public getDeviceInformationFromMemoryByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4726
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationList()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    .line 4210
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceInformationListFromDB()Ljava/util/List;
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
    .line 1020
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/CacheManager;->getInitialDeviceListGeneric()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;
    .locals 7
    .param p1, "fromLocal"    # Z
    .param p2, "fromRemote"    # Z
    .param p3, "fromDevices"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZZ)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;"
        }
    .end annotation

    .prologue
    const/4 v6, 0x0

    .line 4167
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v4, p1, p2, p3}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceListFromDB(ZZZ)Ljava/util/ArrayList;

    move-result-object v2

    .line 4169
    .local v2, "devices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz p2, :cond_2

    .line 4170
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 4171
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 4172
    :cond_1
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-virtual {p0, v4, v6, v6, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 4174
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v1, :cond_0

    .line 4175
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    goto :goto_0

    .line 4180
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_2
    return-object v2
.end method

.method public getDeviceNameFromDevicesCacheList(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2582
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationArrayList()Ljava/util/ArrayList;

    move-result-object v1

    .line 2583
    .local v1, "deviceList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 2584
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 2585
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 2586
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v3

    .line 2590
    .end local v0    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_0
    return-object v3

    :cond_1
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public getDeviceObjectByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 6653
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 6654
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 6655
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6656
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getInsightData()V

    .line 6658
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 6659
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v3, v3, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 6661
    :cond_1
    return-object v0
.end method

.method public getDevicePresetCloud(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 6838
    const-string v1, "DeviceListManager"

    const-string v2, " :: getDevicePresetCloud :: is called"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6839
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 6840
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6841
    .local v0, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;

    invoke-direct {v1, p2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForGetDevicePreset;-><init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6847
    .end local v0    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 6844
    :cond_0
    const-string v1, "DeviceListManager"

    const-string v2, "JSONArray or SetAndGetActionCallBack is null "

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6845
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method

.method public getDeviceState(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 3480
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 3481
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v1, "-1"

    .line 3482
    .local v1, "state":Ljava/lang/String;
    if-eqz v0, :cond_0

    .line 3483
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    .line 3485
    :cond_0
    return-object v1
.end method

.method public getDeviceUDNListFromDB()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1024
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/CacheManager;->getDeviceUDNList()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getDevicesStartTimes()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .prologue
    .line 476
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    return-object v0
.end method

.method public getDiscoveredDeviceList()Ljava/util/HashMap;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2246
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDiscoveredDeviceList()Ljava/util/HashMap;

    move-result-object v0

    return-object v0
.end method

.method public getFWUpdateInProgressDataMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 2048
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    return-object v0
.end method

.method public getFWVersionsFromDb()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 7311
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getFWVersions()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 7314
    :goto_0
    return-object v1

    .line 7312
    :catch_0
    move-exception v0

    .line 7313
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "Exception in getting FWVersionsFromDb "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 7314
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public getFobSensorListFromDb()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 7238
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getFobSensorList()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 7241
    :goto_0
    return-object v1

    .line 7239
    :catch_0
    move-exception v0

    .line 7240
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "Exception in getting FobSensorListFromDb "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 7241
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public getFwUpdateInProgressDataMap()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;",
            ">;"
        }
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    return-object v0
.end method

.method public getIconFromUri(Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "icon"    # Landroid/net/Uri;

    .prologue
    .line 6456
    const/4 v0, 0x0

    .line 6457
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_0

    .line 6458
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/16 v2, 0x64

    invoke-static {v1, p1, v2}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uriToBitmap(Landroid/content/Context;Landroid/net/Uri;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 6460
    :cond_0
    return-object v0
.end method

.method public getIconFromUriForCrop(Landroid/net/Uri;)Landroid/graphics/Bitmap;
    .locals 3
    .param p1, "icon"    # Landroid/net/Uri;

    .prologue
    .line 6464
    const/4 v0, 0x0

    .line 6465
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz p1, :cond_0

    .line 6466
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/16 v2, 0xf0

    invoke-static {v1, p1, v2}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uriToBitmap(Landroid/content/Context;Landroid/net/Uri;I)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 6468
    :cond_0
    return-object v0
.end method

.method public getLEDDeviceIcon(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "deviceID"    # Ljava/lang/String;
    .param p2, "uploadID"    # Ljava/lang/String;

    .prologue
    .line 5692
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LED ICONINFO: getLEDDeviceIcon: deviceID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; uploadID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5694
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v5, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 5695
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 5696
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconUploadID()Ljava/lang/String;

    move-result-object v4

    .line 5697
    .local v4, "uploadIDInDevice":Ljava/lang/String;
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LED ICONINFO: Requesting for LED Icon uploadID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; UploadID in device: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ;Icon location in device: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5702
    invoke-virtual {p2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 5703
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LED ICONINFO: new uploadID found for deviceID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Downloading new LED icon."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5704
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;

    invoke-direct {v1, p0, p1, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;)V

    .line 5705
    .local v1, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 5706
    .local v2, "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 5759
    .end local v1    # "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIcon;
    .end local v2    # "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v4    # "uploadIDInDevice":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 5709
    :cond_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v5, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDevicesInGroup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v3

    .line 5710
    .local v3, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const-string v5, "DeviceListManager"

    const-string v6, "LED ICONINFO: Requesting for Group Icon"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5712
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "LED ICONINFO: udnList: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5714
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 5715
    const-string v5, "DeviceListManager"

    const-string v6, "LED ICONINFO: All LEDs in group have different UPLOAD ID than latest for group. Downloading new GROUP icon."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5716
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;

    invoke-direct {v1, p0, v3, p2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;)V

    .line 5717
    .local v1, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 5718
    .restart local v2    # "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 5720
    .end local v1    # "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDGroupIcon;
    .end local v2    # "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_2
    const-string v5, "DeviceListManager"

    const-string v6, "LED ICONINFO: CloudRequestGetLEDGroupIcon NOT sent as NO devices found in Group."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public getLEDDeviceIconInfo()V
    .locals 4

    .prologue
    .line 5668
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 5669
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getHomeId()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, p0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    .line 5671
    .local v0, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 5673
    .local v1, "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 5681
    .end local v0    # "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetLEDIconInfo;
    .end local v1    # "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_0
    :goto_0
    return-void

    .line 5675
    :cond_1
    const-string v2, "DeviceListManager"

    const-string v3, "getLEDDeviceIconInfo(): ERROR - Remote access is not enabled."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5676
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->ledIconOnRemoteAccessListener:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    if-nez v2, :cond_0

    .line 5677
    new-instance v2, Lcom/belkin/wemo/cache/devicelist/listener/LEDIconsOnRemoteAccessListener;

    invoke-direct {v2, p0}, Lcom/belkin/wemo/cache/devicelist/listener/LEDIconsOnRemoteAccessListener;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->ledIconOnRemoteAccessListener:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    .line 5678
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->ledIconOnRemoteAccessListener:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    goto :goto_0
.end method

.method public getLEDDeviceListFromDb()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 7254
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getLEDDeviceList()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 7257
    :goto_0
    return-object v1

    .line 7255
    :catch_0
    move-exception v0

    .line 7256
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "Exception in getting FobSensorListFromDb "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 7257
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public getLastDiscoveryTimeByUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4268
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/belkin/wemo/cache/CacheManager;->getLastDiscoveryTime(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLastDiscoveryTimeByUniqueID(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 4278
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/belkin/wemo/cache/CacheManager;->getLastDiscoveryTimeZigBee(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLastHitTimeByUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4272
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/belkin/wemo/cache/CacheManager;->getLastHitTime(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLastHitTimeByUniqueID(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "uniqueID"    # Ljava/lang/String;

    .prologue
    .line 4285
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, p1, v0}, Lcom/belkin/wemo/cache/CacheManager;->getLastHitTimeZigBee(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getLocationByArpMac(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;
    .locals 8
    .param p1, "arpmac"    # Ljava/lang/String;

    .prologue
    .line 6712
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getLocationList()Ljava/util/Set;

    move-result-object v4

    .line 6713
    .local v4, "locations":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/location/Location;>;"
    const/4 v3, 0x0

    .line 6714
    .local v3, "location":Lcom/belkin/wemo/cache/location/Location;
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/location/Location;>;"
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 6715
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/cache/location/Location;

    .line 6716
    .local v6, "tlocation":Lcom/belkin/wemo/cache/location/Location;
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/location/Location;->getArpMacs()Ljava/util/Set;

    move-result-object v0

    .line 6717
    .local v0, "arpmacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 6718
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 6719
    .local v5, "tarpmac":Ljava/lang/String;
    invoke-virtual {v5, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 6721
    move-object v3, v6

    .line 6722
    goto :goto_0

    .line 6727
    .end local v0    # "arpmacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v2    # "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v5    # "tarpmac":Ljava/lang/String;
    .end local v6    # "tlocation":Lcom/belkin/wemo/cache/location/Location;
    :cond_2
    return-object v3
.end method

.method public getLocationByHomeId(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;
    .locals 1
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 6693
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationByHomeIdFromDB(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;

    move-result-object v0

    return-object v0
.end method

.method public getLocationBySSID(Ljava/lang/String;)Lcom/belkin/wemo/cache/location/Location;
    .locals 8
    .param p1, "ssid"    # Ljava/lang/String;

    .prologue
    .line 6738
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getLocationList()Ljava/util/Set;

    move-result-object v3

    .line 6739
    .local v3, "locations":Ljava/util/Set;, "Ljava/util/Set<Lcom/belkin/wemo/cache/location/Location;>;"
    const/4 v2, 0x0

    .line 6740
    .local v2, "location":Lcom/belkin/wemo/cache/location/Location;
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/belkin/wemo/cache/location/Location;>;"
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 6741
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/cache/location/Location;

    .line 6742
    .local v5, "tlocation":Lcom/belkin/wemo/cache/location/Location;
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/location/Location;->getSsids()Ljava/util/Set;

    move-result-object v4

    .line 6743
    .local v4, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    .line 6744
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 6745
    .local v6, "tssid":Ljava/lang/String;
    invoke-virtual {v6, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 6747
    move-object v2, v5

    .line 6748
    goto :goto_0

    .line 6753
    .end local v1    # "iterator2":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    .end local v4    # "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v5    # "tlocation":Lcom/belkin/wemo/cache/location/Location;
    .end local v6    # "tssid":Ljava/lang/String;
    :cond_2
    return-object v2
.end method

.method public getLocationList()Ljava/util/Set;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/cache/location/Location;",
            ">;"
        }
    .end annotation

    .prologue
    .line 6701
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheLocationsManager:Lcom/belkin/wemo/cache/location/CacheLocationsManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/location/CacheLocationsManager;->getLocationsFromMemory()Ljava/util/Set;

    move-result-object v0

    return-object v0
.end method

.method public getNestDevicesFromCloud()V
    .locals 4

    .prologue
    .line 2935
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, p0, v2, v3}, Lcom/belkin/wemo/cache/devicelist/runnable/GetNestDevicesRequestRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 2936
    return-void
.end method

.method public getNetworkType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 484
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getPIRSensorListFromDb()Lorg/json/JSONArray;
    .locals 3

    .prologue
    .line 7230
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/CacheManager;->getPIRSensorList()Lorg/json/JSONArray;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 7233
    :goto_0
    return-object v1

    .line 7231
    :catch_0
    move-exception v0

    .line 7232
    .local v0, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "Exception in getting PIRSensorListFromDb "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 7233
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    goto :goto_0
.end method

.method public getRemoteAccessDet()Lorg/json/JSONArray;
    .locals 5

    .prologue
    .line 4612
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getHomeSSID()Ljava/util/Set;

    move-result-object v2

    .line 4614
    .local v2, "ssids":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4615
    .local v0, "arry":Lorg/json/JSONArray;
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 4616
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "iterator":Ljava/util/Iterator;, "Ljava/util/Iterator<Ljava/lang/String;>;"
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 4617
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 4618
    .local v3, "string":Ljava/lang/String;
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4621
    .end local v3    # "string":Ljava/lang/String;
    :cond_0
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->getHomeId()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4622
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v4

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 4623
    return-object v0
.end method

.method public getSSID(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1094
    const-string v3, "wifi"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 1096
    .local v0, "manager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 1097
    .local v2, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 1098
    .local v1, "ssid":Ljava/lang/String;
    if-nez v1, :cond_0

    const-string v3, ""

    :goto_0
    return-object v3

    :cond_0
    const-string v3, "\""

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method public getScanStartTime(Ljava/lang/String;)J
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2534
    const-wide/16 v0, 0x0

    .line 2535
    .local v0, "scanStartTime":J
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    invoke-virtual {v2}, Ljava/util/HashMap;->size()I

    move-result v2

    if-lez v2, :cond_2

    .line 2536
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 2537
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    invoke-virtual {v2, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    .line 2538
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 2539
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    .line 2549
    :cond_0
    :goto_0
    return-wide v0

    .line 2542
    :cond_1
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    goto :goto_0

    .line 2545
    :cond_2
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesStartTimes:Ljava/util/HashMap;

    iget-wide v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {v2, p1, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 2546
    iget-wide v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    goto :goto_0
.end method

.method public getSubDevicesCount(Ljava/lang/String;)I
    .locals 1
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 7355
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/CacheManager;->getSubDevicesCount(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getTotalTriesByUDN(Ljava/lang/String;Z)I
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "zigbee"    # Z

    .prologue
    .line 4247
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, p1, v0, p2}, Lcom/belkin/wemo/cache/CacheManager;->getTotalTries(Ljava/lang/String;ZZ)I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;
    .locals 1

    .prologue
    .line 4598
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-nez v0, :cond_0

    .line 4599
    new-instance v0, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v0}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 4601
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method public getWeMoDeviceCount()I
    .locals 2

    .prologue
    .line 4476
    const/4 v0, 0x0

    .line 4477
    .local v0, "size":I
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v1, :cond_0

    .line 4478
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v1

    invoke-virtual {v1}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v0

    .line 4480
    :cond_0
    return v0
.end method

.method public hideDevice(Ljava/lang/String;I)V
    .locals 6
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "hide"    # I

    .prologue
    const/4 v5, 0x1

    .line 4678
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 4680
    .local v1, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 4681
    .local v0, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestHideDevice;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestHideDevice;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 4683
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "device info result: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4684
    if-eqz v1, :cond_0

    .line 4685
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDeviceInformation(Ljava/lang/String;)Z

    .line 4686
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v2, v1, v5, v5, v5}, Lcom/belkin/wemo/cache/CacheManager;->deleteDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 4688
    :cond_0
    return-void
.end method

.method public hideGroup(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;)V
    .locals 3
    .param p1, "groupId"    # Ljava/lang/String;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    .prologue
    .line 4691
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Processing hide group request for Group ID:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4692
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, p2, p3, v2, p1}, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 4693
    return-void
.end method

.method public declared-synchronized incrementOfflineLEDCount()V
    .locals 3

    .prologue
    .line 7386
    monitor-enter p0

    :try_start_0
    iget v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I

    .line 7387
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "LED Status Tracking: Offline LED Count INCREMENTED. New Count: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7388
    monitor-exit p0

    return-void

    .line 7386
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public initCache()V
    .locals 6

    .prologue
    .line 1028
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/CacheManager;->getInitialDeviceListGeneric()Ljava/util/List;

    move-result-object v1

    .line 1029
    .local v1, "devList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v3, "DeviceListManager"

    const-string v4, "initCache"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1030
    if-eqz v1, :cond_1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    if-lez v3, :cond_1

    .line 1031
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 1032
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 1033
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "cached device found: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1034
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    goto :goto_0

    .line 1042
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    const-string v3, "DeviceListManager"

    const-string v4, "cache empty"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1051
    :cond_2
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->onCachedDeviceLoaded()V

    .line 1052
    return-void
.end method

.method public initControlPoint()V
    .locals 4

    .prologue
    .line 1055
    const-string v1, "DeviceListManager"

    const-string v2, "initControlPoint"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1057
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v1, :cond_0

    .line 1058
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z

    .line 1059
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 1061
    :cond_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-nez v1, :cond_1

    .line 1062
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v1

    sput-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 1066
    :cond_1
    new-instance v1, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v1}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 1068
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 1069
    .local v0, "ssid":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/ControlPoint;->setSSID(Ljava/lang/String;)V

    .line 1070
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    .line 1072
    const-string v1, "DeviceListManager"

    const-string v2, "Control Point:  start() via DeviceListManager"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1073
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->start()Z

    .line 1075
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iput-wide v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startTime:J

    .line 1076
    const-string v1, "DeviceListManager"

    const-string v2, "register listeners calling start listen"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1077
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startListen()V

    .line 1078
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->refreshListOfWeMoDevicesOnLAN()V

    .line 1080
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v1

    if-nez v1, :cond_2

    .line 1081
    const-string v1, "DeviceListManager"

    const-string v2, "STARTING UNICAST DISCOVERY FOR CACHED DEVICES."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1082
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startUnicastDiscovery()V

    .line 1084
    :cond_2
    return-void
.end method

.method public initiateScanZigBeeDevice(Ljava/lang/String;)V
    .locals 2
    .param p1, "bridgeDevice"    # Ljava/lang/String;

    .prologue
    .line 2232
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;

    invoke-direct {v1, p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$19;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 2239
    return-void
.end method

.method public declared-synchronized isAnyLEDOffline()Z
    .locals 4

    .prologue
    .line 7377
    monitor-enter p0

    const/4 v0, 0x0

    .line 7378
    .local v0, "isOffline":Z
    :try_start_0
    iget v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I

    if-lez v1, :cond_0

    .line 7379
    const/4 v0, 0x1

    .line 7381
    :cond_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "LED Status Tracking: Is Any LED Offline = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Offline count: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7382
    monitor-exit p0

    return v0

    .line 7377
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public isDeviceDiscovered(Ljava/lang/String;)Z
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 2602
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceDiscovered(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isDeviceNotReachable()Z
    .locals 1

    .prologue
    .line 242
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceNotReachable:Z

    return v0
.end method

.method public isDevicePairingInProgress()Z
    .locals 2

    .prologue
    .line 1144
    const/4 v0, 0x0

    .line 1145
    .local v0, "isPairing":Z
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    if-eqz v1, :cond_0

    .line 1146
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress()Z

    move-result v0

    .line 1148
    :cond_0
    return v0
.end method

.method public isFWUpdateInProgress()Z
    .locals 8

    .prologue
    .line 7504
    const/4 v5, 0x0

    .line 7508
    .local v5, "isFWProgress":Z
    :try_start_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    .line 7509
    .local v0, "cachedDevices":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v6

    if-lez v6, :cond_2

    .line 7510
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 7511
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 7512
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v3

    .line 7513
    .local v3, "fwState":Ljava/lang/String;
    const-string v6, "0"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "1"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    const-string v6, "3"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-eqz v6, :cond_0

    .line 7514
    :cond_1
    const/4 v5, 0x1

    .line 7525
    .end local v0    # "cachedDevices":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "fwState":Ljava/lang/String;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_0
    return v5

    .line 7521
    :catch_0
    move-exception v2

    .line 7522
    .local v2, "e":Ljava/lang/Exception;
    const-string v6, "DeviceListManager"

    const-string v7, "Exception: "

    invoke-static {v6, v7, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public isFirstRemoteCall()Z
    .locals 1

    .prologue
    .line 832
    sget-boolean v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    return v0
.end method

.method public isGenericFirmware(Ljava/lang/String;)Z
    .locals 8
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 983
    const/4 v2, 0x0

    .line 984
    .local v2, "hasGenericFirmware":Z
    const/4 v5, 0x5

    new-array v1, v5, [Ljava/lang/String;

    const/4 v5, 0x0

    const-string v6, "coffee"

    aput-object v6, v1, v5

    const/4 v5, 0x1

    const-string v6, "humidifier"

    aput-object v6, v1, v5

    const/4 v5, 0x2

    const-string v6, "heater"

    aput-object v6, v1, v5

    const/4 v5, 0x3

    const-string v6, "purifier"

    aput-object v6, v1, v5

    const/4 v5, 0x4

    const-string v6, "crockpot"

    aput-object v6, v1, v5

    .line 986
    .local v1, "genericFWDevices":[Ljava/lang/String;
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 987
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "empty udn:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    move v3, v2

    .line 1001
    .end local v2    # "hasGenericFirmware":Z
    .local v3, "hasGenericFirmware":I
    :goto_0
    return v3

    .line 992
    .end local v3    # "hasGenericFirmware":I
    .restart local v2    # "hasGenericFirmware":Z
    :cond_0
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    :try_start_0
    array-length v5, v1

    if-ge v4, v5, :cond_2

    .line 993
    invoke-virtual {p1}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v5

    aget-object v6, v1, v4

    invoke-virtual {v5, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v5

    if-eqz v5, :cond_1

    .line 994
    const/4 v2, 0x1

    move v3, v2

    .line 1001
    .restart local v3    # "hasGenericFirmware":I
    goto :goto_0

    .line 992
    .end local v3    # "hasGenericFirmware":I
    :cond_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    move v3, v2

    .line 1001
    .restart local v3    # "hasGenericFirmware":I
    goto :goto_0

    .line 998
    .end local v3    # "hasGenericFirmware":I
    :catch_0
    move-exception v0

    .line 999
    .local v0, "ex":Ljava/lang/Exception;
    :try_start_1
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Exception for udn:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ", ex:"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move v3, v2

    .line 1001
    .restart local v3    # "hasGenericFirmware":I
    goto :goto_0

    .end local v0    # "ex":Ljava/lang/Exception;
    .end local v3    # "hasGenericFirmware":I
    :catchall_0
    move-exception v5

    move v3, v2

    .restart local v3    # "hasGenericFirmware":I
    goto :goto_0
.end method

.method public isSmart(Ljava/lang/String;)Z
    .locals 1
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 4522
    const-string v0, "Heater"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Humidifier"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "AirPurifier"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "CoffeeMaker"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 4525
    :cond_0
    const/4 v0, 0x1

    .line 4527
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isZigbee(Ljava/lang/String;)Z
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 5864
    const/4 v0, 0x0

    .line 5866
    .local v0, "hasBridgeUdn":Z
    if-eqz p1, :cond_0

    .line 5867
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 5868
    .local v1, "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v1, :cond_0

    .line 5869
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 5870
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "isZigbee mDeviceInfo.getBridgeUDN() : "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5871
    const/4 v0, 0x1

    .line 5876
    .end local v1    # "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    return v0
.end method

.method public makeCloudRequestForUpdateDeviceList()V
    .locals 6

    .prologue
    .line 2919
    const-string v3, "RemoteMode:"

    const-string v4, "in makeCloudRequestForUpdateDeviceList"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2920
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V

    .line 2923
    :try_start_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    iput-wide v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startDiscoveryTimeForRemote:J

    .line 2924
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, p0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    .line 2926
    .local v2, "upd":Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 2927
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 2932
    .end local v0    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "upd":Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;
    :goto_0
    return-void

    .line 2928
    :catch_0
    move-exception v1

    .line 2929
    .local v1, "e":Ljava/lang/Exception;
    const-string v3, ""

    const-string v4, "Discovery TimeOut"

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public makeRequestForGettingDevicesFromCloud(Landroid/content/Context;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 2884
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/Locks;->isLocked(Ljava/lang/Integer;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 2885
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/Locks;->setLock(Ljava/lang/Integer;)V

    .line 2887
    :try_start_0
    const-string v3, "RemoteMode:"

    const-string v4, "in makeRequestForGettingDevicesFromCloud"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2902
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;

    invoke-direct {v2, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    .line 2904
    .local v2, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-direct {v1, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 2905
    .local v1, "mgr":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2910
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    .line 2915
    .end local v1    # "mgr":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "req":Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;
    :goto_0
    return-void

    .line 2906
    :catch_0
    move-exception v0

    .line 2907
    .local v0, "e":Ljava/lang/Exception;
    :try_start_1
    const-string v3, ""

    const-string v4, "Discovery TimeOut"

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 2910
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v3

    sget-object v4, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    goto :goto_0

    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v3

    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v4

    sget-object v5, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/utils/Locks;->unsetLock(Ljava/lang/Integer;)V

    throw v3

    .line 2913
    :cond_0
    const-string v3, ""

    const-string v4, "Discovery TimeOut"

    invoke-direct {p0, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public makeStateChangeRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "pluginID"    # Ljava/lang/String;
    .param p3, "mac"    # Ljava/lang/String;
    .param p4, "newState"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 2940
    const-string v2, "setNewStateForDevice: "

    const-string v3, "makeStateChangeRequest"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2941
    const-string v2, ""

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, ""

    invoke-virtual {p3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 2942
    :cond_0
    const/4 v2, 0x1

    invoke-virtual {p0, p1, v4, v2, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v1

    .line 2944
    .local v1, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v1, :cond_1

    .line 2945
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object p2

    .line 2946
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object p3

    .line 2949
    .end local v1    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 2952
    .local v0, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    return-void
.end method

.method public nestTokenExistenceCheck()V
    .locals 3

    .prologue
    .line 7470
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v1, p0, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 7471
    return-void
.end method

.method public onDeviceFWUpdateStarted(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 269
    const-string v1, ""

    .line 270
    .local v1, "oldFWVersion":Ljava/lang/String;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 271
    .local v0, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 272
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v1

    .line 274
    :cond_0
    invoke-virtual {p0, p1, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->onDeviceFWUpdateStarted(Ljava/lang/String;Ljava/lang/String;)V

    .line 275
    return-void
.end method

.method public onDeviceFWUpdateStarted(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "oldFWVersion"    # Ljava/lang/String;

    .prologue
    .line 256
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;-><init>()V

    .line 257
    .local v0, "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setUdn(Ljava/lang/String;)V

    .line 258
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->setOldFwVersion(Ljava/lang/String;)V

    .line 259
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FW Update: onDeviceFWUpdateStarted: Adding to fwUpdateInProgressDataMap. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "old FW Version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 260
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v1, p1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 261
    return-void
.end method

.method public onDiscoveryRetry(Ljava/lang/String;)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4673
    const-string v0, "Discovery ReTry"

    invoke-direct {p0, p1, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotificationAboutDiscoveryStateChange(Ljava/lang/String;Ljava/lang/String;)V

    .line 4675
    return-void
.end method

.method public onNestSilentPushNotificationReceived(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "UDN"    # Ljava/lang/String;
    .param p2, "attribute"    # Ljava/lang/String;
    .param p3, "attributeValue"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 7429
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 7430
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 7431
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "dev attribute: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7433
    const-string v3, "Name"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 7434
    invoke-virtual {v0, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 7446
    :goto_0
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 7447
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v4, 0x1

    invoke-virtual {v3, v0, v6, v6, v4}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 7448
    const-string v3, "update"

    const-string v4, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7449
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 7451
    new-instance v2, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 7452
    .local v2, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v3, "cache.db"

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v2, v3, v4}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 7456
    .end local v2    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_0
    return-void

    .line 7435
    :cond_1
    const-string v3, "StructureName"

    invoke-virtual {p2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 7436
    invoke-virtual {v0, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setParentName(Ljava/lang/String;)V

    goto :goto_0

    .line 7440
    :cond_2
    :try_start_0
    invoke-virtual {v0, p2, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 7441
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "dev attribute: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 7442
    :catch_0
    move-exception v1

    .line 7443
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception for udn:"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", e: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public onNetworkChange(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
    .locals 4
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    .line 915
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateLocalMode()V

    .line 917
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v0

    .line 918
    .local v0, "currentSSID":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 919
    const-string v0, ""

    .line 921
    :cond_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "onNetworkChange currentSSID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lastSSID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " isLocal: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " lastModeLocal: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 924
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    iget-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    if-eq v1, v2, :cond_2

    .line 925
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    .line 926
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 927
    const-string v1, "pluginConnected"

    const-string v2, ""

    const-string v3, ""

    invoke-virtual {p0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 938
    :goto_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    iput-boolean v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastModeLocal:Z

    .line 940
    :cond_2
    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    .line 941
    return-void

    .line 928
    :cond_3
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 929
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopLocalMode()V

    .line 930
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->restartLocalMode(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    goto :goto_0

    .line 932
    :cond_4
    const/4 v1, 0x1

    sput-boolean v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    .line 933
    const-string v1, ""

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    .line 934
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeCloudRequestForUpdateDeviceList()V

    .line 935
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 936
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V

    goto :goto_0
.end method

.method public onOverTempNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 6
    .param p1, "overTempState"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 4417
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceByMACFromDB(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4418
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 4421
    :try_start_0
    const-string v2, "overTemp"

    invoke-virtual {v0, v2, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4425
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4426
    const-string v2, "update"

    const-string v3, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4427
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v5, v5, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 4429
    :cond_0
    return-object v0

    .line 4422
    :catch_0
    move-exception v1

    .line 4423
    .local v1, "e":Lorg/json/JSONException;
    const-string v2, "DeviceListManager"

    const-string v3, "onOverTempNotificationReceived: JSONException while setting OverTemp as attribute in DeviceInfo: "

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public onPause()V
    .locals 2

    .prologue
    .line 877
    const-string v0, "DeviceListManager"

    const-string v1, "ON PAUSE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 878
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetForcedRemoteFlag()V

    .line 880
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateLocalMode()V

    .line 881
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V

    .line 882
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 883
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopLocalMode()V

    .line 885
    :cond_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 886
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setDeviceUnicastFailedCount(I)V

    .line 890
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 891
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/WemoUtils;->writeFirmwareUpgradeInProgressState(Ljava/util/Map;Landroid/content/Context;)Z

    .line 893
    :cond_1
    const-string v0, "DeviceListManager"

    const-string v1, "FW Update: fwUpdateInProgressDataMap writing to Internal Memory"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 894
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 895
    return-void
.end method

.method public onResume(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
    .locals 6
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    const/4 v5, 0x0

    .line 596
    const-string v3, "DeviceListManager"

    const-string v4, "ON RESUME: DEVICELISTMANAGER"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 597
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setDeviceUnicastFailedCount(I)V

    .line 598
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3, v5}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setCloudCacheCalledSuccessfully(Z)V

    .line 599
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v2

    .line 600
    .local v2, "wemoApConnected":Z
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v3

    if-nez v3, :cond_0

    .line 601
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateLocalMode()V

    .line 603
    :cond_0
    if-eqz v2, :cond_4

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v3

    if-nez v3, :cond_4

    .line 604
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->bindToNetwork()V

    .line 606
    const-string v3, "DeviceListManager"

    const-string v4, "Plugin Connected"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    const-string v3, "pluginConnected"

    const-string v4, ""

    const-string v5, ""

    invoke-virtual {p0, v3, v4, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 608
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initCache()V

    .line 609
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initControlPoint()V

    .line 635
    :cond_1
    :goto_0
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/CacheManager;->getNestDeviceUDNList()Landroid/database/Cursor;

    move-result-object v3

    invoke-interface {v3}, Landroid/database/Cursor;->getCount()I

    move-result v1

    .line 636
    .local v1, "noOfNestDevicesInHome":I
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "No. of nest devices available in home: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 637
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "NetworkMode is: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 638
    if-lez v1, :cond_2

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 639
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNestDevicesFromCloud()V

    .line 642
    :cond_2
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getEmailOptDeviceType()Ljava/lang/String;

    move-result-object v0

    .line 643
    .local v0, "deviceType":Ljava/lang/String;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "deviceType: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 644
    const-string v3, ""

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 645
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->collectEmailIDToCloud()V

    .line 647
    :cond_3
    return-void

    .line 610
    .end local v0    # "deviceType":Ljava/lang/String;
    .end local v1    # "noOfNestDevicesInHome":I
    :cond_4
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled()Z

    move-result v3

    if-nez v3, :cond_5

    .line 612
    const-string v3, "DeviceListManager"

    const-string v4, "local mode"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 613
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->verifyHomeNetwork()V

    .line 614
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startListen()V

    .line 615
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 616
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initCache()V

    .line 617
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V

    .line 618
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initControlPoint()V

    goto/16 :goto_0

    .line 620
    :cond_5
    if-nez v2, :cond_1

    .line 621
    const-string v3, "DeviceListManager"

    const-string v4, "remote mode"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 623
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initCache()V

    .line 624
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V

    .line 625
    new-instance v3, Ljava/lang/Thread;

    new-instance v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$2;

    invoke-direct {v4, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$2;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v3, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 631
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 632
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V

    goto/16 :goto_0
.end method

.method public onSilentStatusNotificationReceived(Ljava/lang/String;Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 6
    .param p1, "status"    # Ljava/lang/String;
    .param p2, "mac"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 4433
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceByMACFromDB(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4438
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 4449
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-nez v2, :cond_1

    .line 4451
    :try_start_0
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setBinaryState(Ljava/lang/String;)V

    .line 4452
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 4453
    const-string v2, "binaryState"

    invoke-virtual {v0, v2, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 4459
    :goto_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4460
    const-string v2, "change_state"

    const-string v3, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4461
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v5, v5, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 4467
    :cond_0
    :goto_1
    return-object v0

    .line 4454
    :catch_0
    move-exception v1

    .line 4455
    .local v1, "e":Lorg/json/JSONException;
    const-string v2, "DeviceListManager"

    const-string v3, "onSilentStatusNotificationReceived: JSONException while setting BinaryState as attribute in DeviceInfo: "

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 4456
    .end local v1    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v1

    .line 4457
    .local v1, "e":Ljava/lang/NumberFormatException;
    const-string v2, "DeviceListManager"

    const-string v3, "onSilentStatusNotificationReceived: NumberFormatException while setting State in DeviceInfo: "

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 4463
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    const-string v2, "DeviceListManager"

    const-string v3, "onSilentStatusNotificationReceived: Not processing as local mode. Processed only in Remote mode. "

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onStart()V
    .locals 2

    .prologue
    .line 899
    const-string v0, "DeviceListManager"

    const-string v1, "ON START"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 900
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetForcedRemoteFlag()V

    .line 901
    return-void
.end method

.method public populateDeviceList()V
    .locals 10

    .prologue
    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 5126
    const-string v5, "DeviceListManager"

    const-string v6, "CloudCache: populateDeviceList called"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5127
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformationList()Ljava/util/Map;

    move-result-object v0

    .line 5129
    .local v0, "cachedDevices":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-eqz v0, :cond_2

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v5

    if-lez v5, :cond_2

    .line 5130
    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 5131
    .local v1, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 5132
    .local v2, "device":Lorg/cybergarage/upnp/Device;
    invoke-virtual {p0, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 5133
    invoke-virtual {v1, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 5134
    invoke-virtual {v1, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 5135
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getFriendlyNameFromDevice()Ljava/lang/String;

    move-result-object v3

    .line 5136
    .local v3, "friendlyName":Ljava/lang/String;
    if-eqz v3, :cond_0

    .line 5137
    invoke-virtual {v1, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 5143
    .end local v3    # "friendlyName":Ljava/lang/String;
    :cond_0
    :goto_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v5, v1, v9}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 5144
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v5, v1, v8, v8, v9}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 5145
    const-string v5, "update"

    const-string v6, ""

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p0, v5, v6, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5140
    :cond_1
    invoke-virtual {v1, v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 5141
    invoke-virtual {v1, v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    goto :goto_1

    .line 5148
    .end local v1    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "device":Lorg/cybergarage/upnp/Device;
    .end local v4    # "i$":Ljava/util/Iterator;
    :cond_2
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v5

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->onCachedDeviceLoaded()V

    .line 5149
    return-void
.end method

.method public postControlAction(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "constant"    # Ljava/lang/String;
    .param p3, "attribute"    # Ljava/lang/String;

    .prologue
    .line 6050
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 6051
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 6052
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v3, p2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 6053
    .local v0, "actionObj":Lorg/cybergarage/upnp/Action;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 6054
    .local v4, "response":Ljava/lang/String;
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "response "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6059
    .end local v0    # "actionObj":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :goto_0
    return-void

    .line 6056
    :catch_0
    move-exception v2

    .line 6057
    .local v2, "e":Ljava/lang/Exception;
    const-string v5, "DeviceListManager"

    const-string v6, "Get insight parameters exception: "

    invoke-static {v5, v6, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;
    .locals 2
    .param p1, "resetType"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "status"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 6293
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 6294
    .local v0, "completeResponse":Lorg/json/JSONObject;
    const-string v1, "resetType"

    invoke-virtual {v0, v1, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6295
    const-string v1, "udn"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6296
    const-string v1, "success"

    invoke-virtual {v0, v1, p3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6297
    return-object v0
.end method

.method public printFwUpgradeInProgressMapIfDebug()V
    .locals 5

    .prologue
    .line 466
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 467
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FW Update: fwUpdateInProgressDataMap current state. Size = "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 469
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 470
    .local v0, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;>;"
    const-string v3, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "FW Update: KEY: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "; VALUE: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 473
    .end local v0    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;>;"
    .end local v1    # "i$":Ljava/util/Iterator;
    :cond_0
    return-void
.end method

.method public processFWUpgradeStatus(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 8
    .param p1, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    .line 1986
    const-string v5, "DeviceListManager"

    const-string v6, "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1987
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 1989
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    .line 1990
    .local v4, "udn":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFwStatus()Ljava/lang/String;

    move-result-object v2

    .line 1991
    .local v2, "fwStatus":Ljava/lang/String;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;

    .line 1992
    .local v1, "data":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;
    if-eqz v1, :cond_5

    .line 2001
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$FirmwareUpdateData;->getOldFwVersion()Ljava/lang/String;

    move-result-object v3

    .line 2002
    .local v3, "oldFWVersion":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v0

    .line 2003
    .local v0, "currentFWVersion":Ljava/lang/String;
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FW Update: analyzeFWUpgradeStatus: Device found in fwUpdateInProgressDataMap. Old FW Version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Current FW Version: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; fwStatus from Device (if any): "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2005
    const-string v5, "4"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 2006
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 2015
    const-string v2, "5"

    .line 2019
    :cond_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2021
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus: removed UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2022
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    .line 2037
    :cond_1
    :goto_0
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FW Update: analyzeFWUpgradeStatus: Device found in fwUpdateInProgressDataMap. Final fwStatus calculated: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2038
    invoke-virtual {p1, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFwStatus(Ljava/lang/String;)V

    .line 2039
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 2040
    const-string v5, "FirmwareUpdateStatus"

    invoke-virtual {p0, v5, v2, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2045
    .end local v0    # "currentFWVersion":Ljava/lang/String;
    .end local v3    # "oldFWVersion":Ljava/lang/String;
    :cond_2
    :goto_1
    return-void

    .line 2024
    .restart local v0    # "currentFWVersion":Ljava/lang/String;
    .restart local v3    # "oldFWVersion":Ljava/lang/String;
    :cond_3
    const-string v5, "0"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "1"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    const-string v5, "3"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 2026
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_4

    .line 2028
    const-string v2, "4"

    .line 2032
    :cond_4
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->fwUpdateInProgressDataMap:Ljava/util/Map;

    invoke-interface {v5, v4}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2033
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "FW Update: fwUpdateInProgressDataMap: processFWUpgradeStatus: removed UDN: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2034
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->printFwUpgradeInProgressMapIfDebug()V

    goto :goto_0

    .line 2043
    .end local v0    # "currentFWVersion":Ljava/lang/String;
    .end local v3    # "oldFWVersion":Ljava/lang/String;
    :cond_5
    const-string v5, "DeviceListManager"

    const-string v6, "FW Update: analyzeFWUpgradeStatus: Device NOT FOUND in fwUpdateInProgressDataMap."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public declared-synchronized recreateControlPoint()Z
    .locals 1

    .prologue
    .line 3940
    monitor-enter p0

    const/4 v0, 0x0

    :try_start_0
    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->recreateControlPoint(Z)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized recreateControlPoint(Z)Z
    .locals 4
    .param p1, "withoutNetworkSwitch"    # Z

    .prologue
    .line 3911
    monitor-enter p0

    :try_start_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Recreating Control Point. Is recreation required without network switch: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3913
    if-nez p1, :cond_0

    .line 3914
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 3916
    .local v0, "ssid":Ljava/lang/String;
    const-string v1, "WeMoSDK"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Control Point NETWORK SWITCH CHECK. LastSSID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; ssid: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; mControlPoint: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; hash: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3921
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->lastSSID:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3922
    const-string v1, "WeMoSDK"

    const-string v2, "Control Point NOT BEEN RE-CREATED as network has not switched."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3923
    const/4 v1, 0x0

    .line 3936
    .end local v0    # "ssid":Ljava/lang/String;
    :goto_0
    monitor-exit p0

    return v1

    .line 3927
    :cond_0
    :try_start_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    if-eqz v1, :cond_1

    .line 3928
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearAll()V

    .line 3931
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v1, :cond_2

    .line 3932
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->forceClose()V

    .line 3935
    :cond_2
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initControlPoint()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 3936
    const/4 v1, 0x1

    goto :goto_0

    .line 3911
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public refreshListOfWeMoDevicesOnLAN()V
    .locals 3

    .prologue
    .line 3245
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setDeviceNonReachibility(Z)V

    .line 3246
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/MSearchRequestRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 3254
    return-void
.end method

.method public refreshLongPressRuleDetails(ILjava/lang/String;)V
    .locals 4
    .param p1, "ruleId"    # I
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 4925
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "refreshLongPressRuleDetails: Request for refresh via RULE ID and UDN - RuleID: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4926
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4927
    .local v0, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 4928
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v1

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v1

    new-instance v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;

    invoke-direct {v2, p0, v0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$21;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;)V

    new-instance v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;

    invoke-direct {v3, p0, p2, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$22;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    invoke-interface {v1, p1, v2, v3}, Lcom/belkin/wemo/rules/RMIRules;->getRuleFromCache(ILcom/belkin/wemo/rules/callback/RMGetRuleSuccessCallback;Lcom/belkin/wemo/rules/callback/RMGetRuleErrorCallback;)V

    .line 5021
    :goto_0
    return-void

    .line 5019
    :cond_0
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "refreshLongPressRuleDetails: NO device information obj found for UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public refreshLongPressRuleDetails(Ljava/lang/String;Lcom/belkin/wemo/rules/data/RMLongPressRule;)V
    .locals 13
    .param p1, "triggerDeviceUdn"    # Ljava/lang/String;
    .param p2, "currentRule"    # Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .prologue
    .line 4868
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "refreshLongPressRuleDetails: Request for refresh via Single Rule - TriggerDeviceUDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4869
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4870
    .local v0, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_4

    .line 4871
    const/4 v8, 0x0

    .line 4872
    .local v8, "udnMatchFoundInRule":Z
    if-eqz p2, :cond_3

    .line 4873
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "refreshLongPressRuleDetails: Request for refresh via Single Rule - Rule: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4874
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 4875
    .local v4, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v6

    .line 4876
    .local v6, "udn":Ljava/lang/String;
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "refreshLongPressRuleDetails: Request for refresh via Single Rule - Rule Device UDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4878
    invoke-virtual {p1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 4879
    const/4 v8, 0x1

    .line 4882
    :try_start_0
    const-string v9, "longPressRuleState"

    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4883
    const-string v9, "longPressRuleDeviceCnt"

    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v10

    invoke-interface {v10}, Ljava/util/Set;->size()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4884
    const-string v9, "longPressRuleAction"

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v10

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4886
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 4887
    .local v7, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {p2}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v9

    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 4888
    .local v5, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v9

    invoke-interface {v7, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 4896
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v5    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v7    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v1

    .line 4897
    .local v1, "e":Lorg/json/JSONException;
    const-string v9, "DeviceListManager"

    const-string v10, "JSONException while refreshing long press rule attributes: "

    invoke-static {v9, v10, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 4890
    .end local v1    # "e":Lorg/json/JSONException;
    .restart local v3    # "i$":Ljava/util/Iterator;
    .restart local v7    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_1
    :try_start_1
    const-string v9, "longPressRuleDeviceUdn"

    const-string v10, ","

    invoke-static {v10, v7}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4892
    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4893
    const-string v9, "update"

    const-string v10, ""

    invoke-virtual {p0, v9, v10, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4894
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-virtual {v9, v0, v10, v11, v12}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 4922
    .end local v3    # "i$":Ljava/util/Iterator;
    .end local v4    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v6    # "udn":Ljava/lang/String;
    .end local v7    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v8    # "udnMatchFoundInRule":Z
    :cond_2
    :goto_2
    return-void

    .line 4904
    .restart local v8    # "udnMatchFoundInRule":Z
    :cond_3
    if-nez v8, :cond_2

    .line 4905
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "refreshLongPressRuleDetails: Request for refresh via Single Rule - UDN MATCH NOT FOUND. Resetting all Long press attributes for UDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4907
    :try_start_2
    const-string v9, "longPressRuleState"

    const-string v10, "-1"

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4908
    const-string v9, "longPressRuleDeviceCnt"

    const-string v10, "0"

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4909
    const-string v9, "longPressRuleAction"

    const-string v10, "-1"

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4910
    const-string v9, "longPressRuleDeviceUdn"

    const-string v10, " "

    invoke-virtual {v0, v9, v10}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4912
    iget-object v9, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4913
    const-string v9, "update"

    const-string v10, ""

    invoke-virtual {p0, v9, v10, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4914
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x1

    invoke-virtual {v9, v0, v10, v11, v12}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 4915
    :catch_1
    move-exception v1

    .line 4916
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v9, "DeviceListManager"

    const-string v10, "JSONException while resetting long press rule attributes: "

    invoke-static {v9, v10, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_2

    .line 4920
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v8    # "udnMatchFoundInRule":Z
    :cond_4
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "refreshLongPressRuleDetails: Request for refresh via Single Rule - NO device information obj found for UDN: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public refreshLongPressRuleDetails(Ljava/lang/String;Ljava/util/List;)V
    .locals 21
    .param p1, "triggerDeviceUdn"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/data/RMRule;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 4799
    .local p2, "rulesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/rules/data/RMRule;>;"
    const-string v17, "DeviceListManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refreshLongPressRuleDetails: Request for refresh via RulesList - TriggerDeviceUDN: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    const-string v19, "; rules list count: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-interface/range {p2 .. p2}, Ljava/util/List;->size()I

    move-result v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4800
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v6

    .line 4801
    .local v6, "deviceInformation":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v6, :cond_5

    .line 4802
    const/16 v16, 0x0

    .line 4803
    .local v16, "udnMatchFoundInRule":Z
    invoke-interface/range {p2 .. p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_4

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/belkin/wemo/rules/data/RMRule;

    .line 4804
    .local v11, "rule":Lcom/belkin/wemo/rules/data/RMRule;
    invoke-virtual {v11}, Lcom/belkin/wemo/rules/data/RMRule;->getRulesType()I

    move-result v17

    const/16 v18, 0x2

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_0

    move-object v5, v11

    .line 4805
    check-cast v5, Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 4806
    .local v5, "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    invoke-virtual {v5}, Lcom/belkin/wemo/rules/data/RMDBRule;->getRuleType()Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-result-object v17

    sget-object v18, Lcom/belkin/wemo/rules/data/RMDBRuleType;->LONG_PRESS:Lcom/belkin/wemo/rules/data/RMDBRuleType;

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    if-ne v0, v1, :cond_0

    move-object v4, v11

    .line 4807
    check-cast v4, Lcom/belkin/wemo/rules/data/RMLongPressRule;

    .line 4808
    .local v4, "currentRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    const-string v17, "DeviceListManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refreshLongPressRuleDetails: Request for refresh via RulesList - Rule: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4809
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getRuleDeviceSet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_1
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_0

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;

    .line 4810
    .local v12, "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getUiUdn()Ljava/lang/String;

    move-result-object v14

    .line 4811
    .local v14, "udn":Ljava/lang/String;
    const-string v17, "DeviceListManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refreshLongPressRuleDetails: Request for refresh via RulesList - Rule Device UDN: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    invoke-virtual {v0, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4813
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 4814
    const/16 v16, 0x1

    .line 4817
    :try_start_0
    const-string v17, "longPressRuleState"

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getState()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4818
    const-string v17, "longPressRuleDeviceCnt"

    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v18

    invoke-interface/range {v18 .. v18}, Ljava/util/Set;->size()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4819
    const-string v17, "longPressRuleAction"

    invoke-virtual {v12}, Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;->getStartAction()I

    move-result v18

    invoke-static/range {v18 .. v18}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4821
    new-instance v15, Ljava/util/ArrayList;

    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 4822
    .local v15, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-virtual {v4}, Lcom/belkin/wemo/rules/data/RMLongPressRule;->getTargetDeviceSet()Ljava/util/Set;

    move-result-object v17

    invoke-interface/range {v17 .. v17}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v10

    .local v10, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v17

    if-eqz v17, :cond_2

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lcom/belkin/wemo/rules/data/RMTargetDevice;

    .line 4823
    .local v13, "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    invoke-virtual {v13}, Lcom/belkin/wemo/rules/data/RMTargetDevice;->getDeviceId()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    invoke-interface {v15, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 4831
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v13    # "targetDevice":Lcom/belkin/wemo/rules/data/RMTargetDevice;
    .end local v15    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :catch_0
    move-exception v7

    .line 4832
    .local v7, "e":Lorg/json/JSONException;
    const-string v17, "DeviceListManager"

    const-string v18, "JSONException while refreshing long press rule attributes: "

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_0

    .line 4825
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v10    # "i$":Ljava/util/Iterator;
    .restart local v15    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :try_start_1
    const-string v17, "longPressRuleDeviceUdn"

    const-string v18, ","

    move-object/from16 v0, v18

    invoke-static {v0, v15}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4827
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4828
    const-string v17, "update"

    const-string v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    invoke-virtual {v0, v1, v2, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4829
    sget-object v17, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 4861
    .end local v4    # "currentRule":Lcom/belkin/wemo/rules/data/RMLongPressRule;
    .end local v5    # "dbRule":Lcom/belkin/wemo/rules/data/RMDBRule;
    .end local v10    # "i$":Ljava/util/Iterator;
    .end local v11    # "rule":Lcom/belkin/wemo/rules/data/RMRule;
    .end local v12    # "ruleDevice":Lcom/belkin/wemo/rules/data/device/RMDBRuleDevice;
    .end local v14    # "udn":Ljava/lang/String;
    .end local v15    # "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v16    # "udnMatchFoundInRule":Z
    :cond_3
    :goto_2
    return-void

    .line 4841
    .restart local v16    # "udnMatchFoundInRule":Z
    :cond_4
    if-nez v16, :cond_3

    .line 4842
    const-string v17, "DeviceListManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refreshLongPressRuleDetails: Request for refresh via RulesList - UDN MATCH NOT FOUND. Resetting all Long press attributes for UDN: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4844
    :try_start_2
    const-string v17, "longPressRuleState"

    const-string v18, "-1"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4845
    const-string v17, "longPressRuleDeviceCnt"

    const-string v18, "0"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4846
    const-string v17, "longPressRuleAction"

    const-string v18, "-1"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4847
    const-string v17, "longPressRuleDeviceUdn"

    const-string v18, " "

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v6, v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 4849
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 4850
    const-string v17, "update"

    const-string v18, ""

    move-object/from16 v0, p0

    move-object/from16 v1, v17

    move-object/from16 v2, v18

    move-object/from16 v3, p1

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4851
    sget-object v17, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/16 v18, 0x1

    const/16 v19, 0x1

    const/16 v20, 0x1

    move-object/from16 v0, v17

    move/from16 v1, v18

    move/from16 v2, v19

    move/from16 v3, v20

    invoke-virtual {v0, v6, v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_2

    .line 4852
    :catch_1
    move-exception v7

    .line 4853
    .restart local v7    # "e":Lorg/json/JSONException;
    const-string v17, "DeviceListManager"

    const-string v18, "JSONException while resetting long press rule attributes: "

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-static {v0, v1, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_2

    .line 4857
    .end local v7    # "e":Lorg/json/JSONException;
    .end local v16    # "udnMatchFoundInRule":Z
    :cond_5
    const-string v17, "DeviceListManager"

    new-instance v18, Ljava/lang/StringBuilder;

    invoke-direct/range {v18 .. v18}, Ljava/lang/StringBuilder;-><init>()V

    const-string v19, "refreshLongPressRuleDetails: Request for refresh via RulesList - NO device information obj found for UDN: "

    invoke-virtual/range {v18 .. v19}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    move-object/from16 v0, v18

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v17 .. v18}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_2
.end method

.method public removeDeviceByUDN(Ljava/lang/String;)V
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 4755
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;ZZ)V

    .line 4756
    return-void
.end method

.method public removeDeviceByUDN(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "notifyListener"    # Z

    .prologue
    .line 4759
    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->removeDeviceByUDN(Ljava/lang/String;ZZ)V

    .line 4760
    return-void
.end method

.method public removeDeviceByUDN(Ljava/lang/String;ZZ)V
    .locals 7
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "notifyListener"    # Z
    .param p3, "viaRemoteDisabled"    # Z

    .prologue
    const/4 v6, 0x1

    .line 4763
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromMemoryByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v2

    .line 4764
    .local v2, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "removeDeviceByUDN devInfo: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; notify Listeners: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; viaRemoteDisabled: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4765
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    if-eqz v3, :cond_0

    .line 4766
    if-eqz v2, :cond_0

    .line 4767
    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v3, v2, v6, v6, v6}, Lcom/belkin/wemo/cache/CacheManager;->deleteDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    move-result v1

    .line 4768
    .local v1, "dbResponse":Z
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDeviceInformation(Ljava/lang/String;)Z

    move-result v0

    .line 4769
    .local v0, "cacheResponse":Z
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "removeDeviceByUDN dbResponse: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ", cacheResponse: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4771
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 4772
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "sending notification for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 4773
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->removeDiscoveredDevice(Ljava/lang/String;)Z

    .line 4775
    if-eqz p2, :cond_0

    .line 4776
    const-string v4, "remove"

    if-eqz p3, :cond_1

    const-string v3, "remote_disabled"

    :goto_0
    invoke-virtual {p0, v4, v3, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 4784
    .end local v0    # "cacheResponse":Z
    .end local v1    # "dbResponse":Z
    :cond_0
    return-void

    .line 4776
    .restart local v0    # "cacheResponse":Z
    .restart local v1    # "dbResponse":Z
    :cond_1
    const-string v3, ""

    goto :goto_0
.end method

.method public removeGroup(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 6
    .param p1, "operation"    # Ljava/lang/String;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "groupID"    # I

    .prologue
    .line 7143
    if-eqz p2, :cond_0

    .line 7144
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 7145
    .local v2, "ruleID":Ljava/lang/String;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Deleting LEDGroup rule for "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7146
    invoke-static {}, Lcom/belkin/wemo/rules/RMRulesSDK;->instance()Lcom/belkin/wemo/rules/RMRulesSDK;

    move-result-object v3

    invoke-virtual {v3}, Lcom/belkin/wemo/rules/RMRulesSDK;->getRules()Lcom/belkin/wemo/rules/RMIRules;

    move-result-object v3

    new-instance v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$25;

    invoke-direct {v4, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$25;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    new-instance v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$26;

    invoke-direct {v5, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$26;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-interface {v3, v2, v4, v5}, Lcom/belkin/wemo/rules/RMIRules;->deleteRulesFromDevice(Ljava/lang/String;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMResetDeviceRulesErrorCallback;)V

    .line 7163
    .end local v2    # "ruleID":Ljava/lang/String;
    :goto_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 7164
    new-instance v1, Lcom/belkin/wemo/cache/network/LEDOperations;

    const-string v3, "RemoveGroup"

    invoke-direct {v1, v3, p2, p3}, Lcom/belkin/wemo/cache/network/LEDOperations;-><init>(Ljava/lang/String;Ljava/lang/String;I)V

    .line 7165
    .local v1, "operations":Lcom/belkin/wemo/cache/network/LEDOperations;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 7172
    .end local v1    # "operations":Lcom/belkin/wemo/cache/network/LEDOperations;
    :goto_1
    return-void

    .line 7161
    :cond_0
    const-string v3, "DeviceListManager"

    const-string v4, " UDN is invalid"

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 7167
    :cond_1
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "calling CloudRequestRemoveGroup: groupID "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7168
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 7169
    .local v0, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {p3}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v3, v4, p2, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestRemoveGroup;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_1
.end method

.method public removeNotificationListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .prologue
    .line 1205
    if-eqz p1, :cond_0

    .line 1206
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 1208
    :cond_0
    return-void
.end method

.method public resetAutoThreshold(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 12
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 6260
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 6261
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "missing UDN udn: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6262
    const/4 v0, 0x0

    .line 6289
    :goto_0
    return v0

    .line 6265
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6266
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;

    const-string v3, "resetAutoThreshold"

    move-object v1, p1

    move-object v2, p2

    move-object v4, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 6289
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 6269
    :cond_1
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v9

    .line 6270
    .local v9, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-nez v9, :cond_2

    .line 6271
    const/4 v0, 0x0

    goto :goto_0

    .line 6273
    :cond_2
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 6274
    .local v6, "attribute":Lorg/json/JSONObject;
    const/4 v7, 0x0

    .line 6276
    .local v7, "autoThresholdStr":Ljava/lang/String;
    :try_start_0
    const-string v0, "powerNow"

    invoke-virtual {v9, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/lit16 v11, v0, 0x7d0

    .line 6277
    .local v11, "newAutoThreshold":I
    invoke-static {v11}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v7

    .line 6278
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "AUTO RESET THRESHOLD (REMOTE): New Threshold calculated value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6280
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    invoke-virtual {v6, v0, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6285
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestAutoResetPowerThreshold;

    const-string v0, "SetPowerThreshold"

    invoke-direct {v8, p0, v9, v0, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestAutoResetPowerThreshold;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6286
    .local v8, "cloudRequest":Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;

    invoke-direct {v0, p1, p2, v7}, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;->setOnCloudRequestCompletedListener(Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;)V

    .line 6287
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_1

    .line 6281
    .end local v8    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;
    .end local v11    # "newAutoThreshold":I
    :catch_0
    move-exception v10

    .line 6282
    .local v10, "e":Lorg/json/JSONException;
    const-string v0, "DeviceListManager"

    const-string v1, "JSONException while setting auto power threshold via REMOTE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6283
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public resetDeviceAll(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 8
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    const/4 v1, 0x0

    .line 6308
    if-nez p3, :cond_1

    .line 6309
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "missing UDN udn: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6319
    :cond_0
    :goto_0
    return v1

    .line 6313
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 6314
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;Lcom/belkin/wemo/cache/utils/SharePreferences;)V

    .line 6315
    .local v0, "oResetAll":Lcom/belkin/wemo/cache/devicelist/runnable/ResetAllRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 6316
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public resetFNIconRules(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 31
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 6139
    const/16 v28, 0x0

    .line 6140
    .local v28, "isProcessing":Z
    if-nez p3, :cond_0

    .line 6141
    const-string v5, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "missing UDN udn: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p3

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6142
    const/16 v28, 0x0

    .line 6145
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 6146
    new-instance v6, Ljava/util/concurrent/CountDownLatch;

    const/4 v5, 0x1

    invoke-direct {v6, v5}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 6147
    .local v6, "latch":Ljava/util/concurrent/CountDownLatch;
    const/16 v28, 0x1

    .line 6148
    const-string v5, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Ready to set device properties: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p4

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ", stateData"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, p5

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6149
    new-instance v4, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;

    move-object/from16 v5, p0

    move-object/from16 v7, p3

    move-object/from16 v8, p4

    move-object/from16 v9, p5

    invoke-direct/range {v4 .. v9}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/util/concurrent/CountDownLatch;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 6150
    .local v4, "oResetFNIconRules":Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v5

    invoke-virtual {v5, v4}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 6152
    invoke-virtual {v6}, Ljava/util/concurrent/CountDownLatch;->await()V

    .line 6153
    const/4 v6, 0x0

    .line 6155
    const-string v5, "DeviceListManager"

    const-string v7, "resetFNIconRules: ResetFNIconRulesRunnable Async Task is complete."

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 6157
    if-eqz p2, :cond_1

    .line 6159
    :try_start_1
    const-string v5, "reset_fn_icon_rules"

    const-string v7, "true"

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v5, v1, v7}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->prepareDeviceResetResponse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v30

    .line 6160
    .local v30, "response":Lorg/json/JSONObject;
    invoke-virtual/range {v30 .. v30}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p2

    invoke-interface {v0, v5}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;->onSuccess(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 6169
    .end local v30    # "response":Lorg/json/JSONObject;
    :cond_1
    :goto_0
    :try_start_2
    const-string v5, "reset_fn_icon_rules"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v0, v28

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, ""

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v5, v7, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6171
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 6173
    new-instance v29, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct/range {v29 .. v29}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 6174
    .local v29, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v5, "cache.db"

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v29

    invoke-virtual {v0, v5, v7}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 6231
    .end local v4    # "oResetFNIconRules":Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;
    .end local v6    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v29    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_2
    :goto_1
    return v28

    .line 6161
    .restart local v4    # "oResetFNIconRules":Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;
    .restart local v6    # "latch":Ljava/util/concurrent/CountDownLatch;
    :catch_0
    move-exception v26

    .line 6162
    .local v26, "e":Lorg/json/JSONException;
    const-string v5, "DeviceListManager"

    const-string v7, "exception in RESET_FN_ICON_RULES: "

    move-object/from16 v0, v26

    invoke-static {v5, v7, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 6163
    if-eqz p1, :cond_1

    .line 6164
    invoke-virtual/range {v26 .. v26}, Lorg/json/JSONException;->getMessage()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-interface {v0, v5}, Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;->onError(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    .line 6228
    .end local v4    # "oResetFNIconRules":Lcom/belkin/wemo/cache/devicelist/runnable/ResetFNIconRulesRunnable;
    .end local v6    # "latch":Ljava/util/concurrent/CountDownLatch;
    .end local v26    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v27

    .line 6229
    .local v27, "ex":Ljava/lang/Exception;
    const-string v5, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception in resetFNIconRules ex:"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 6179
    .end local v27    # "ex":Ljava/lang/Exception;
    :cond_3
    :try_start_3
    const-string v13, ""

    .line 6180
    .local v13, "friendlyName":Ljava/lang/String;
    const-string v5, "friendlyName"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 6181
    const-string v5, "friendlyName"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 6183
    :cond_4
    new-instance v24, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v24

    invoke-direct {v0, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6184
    .local v24, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p3

    invoke-virtual {v5, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v25

    .line 6185
    .local v25, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_5

    .line 6186
    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, p0

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBridgeDataFromBridgeUDN(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    .line 6187
    .local v12, "bridgeData":Lorg/json/JSONObject;
    const-string v5, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "bridgeData: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6188
    new-instance v7, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v10

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v11

    new-instance v14, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$23;

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v2, p3

    invoke-direct {v14, v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$23;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V

    move-object/from16 v8, p0

    move-object/from16 v9, p3

    invoke-direct/range {v7 .. v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRulesZigbee;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6222
    .end local v12    # "bridgeData":Lorg/json/JSONObject;
    :goto_2
    const/16 v28, 0x1

    goto/16 :goto_1

    .line 6202
    :cond_5
    const-string v21, ""

    .line 6203
    .local v21, "modelCode":Ljava/lang/String;
    const-string v5, "modelCode"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 6204
    const-string v5, "modelCode"

    move-object/from16 v0, p5

    invoke-virtual {v0, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 6206
    :cond_6
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;

    sget-object v16, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v25 .. v25}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v19

    new-instance v22, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;

    move-object/from16 v0, v22

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$24;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V

    const/4 v5, 0x1

    new-array v0, v5, [I

    move-object/from16 v23, v0

    const/4 v5, 0x0

    const/4 v7, 0x1

    aput v7, v23, v5

    move-object/from16 v15, p0

    move-object/from16 v17, p3

    move-object/from16 v20, v13

    invoke-direct/range {v14 .. v23}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetFNIRules;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;[I)V

    move-object/from16 v0, v24

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_2

    .line 6223
    .end local v13    # "friendlyName":Ljava/lang/String;
    .end local v21    # "modelCode":Ljava/lang/String;
    .end local v24    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v25    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_2
    move-exception v27

    .line 6224
    .restart local v27    # "ex":Ljava/lang/Exception;
    :try_start_4
    const-string v5, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Error in remote for resetFNIconRules ex"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    move-object/from16 v0, v27

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v5, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_1
.end method

.method public resetHomeNetwork()V
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 944
    const-string v1, "DeviceListManager"

    const-string v2, "Home Network has been changed. Removing all devices and initializing ControlPoint."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 945
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 946
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, v3, v3, v3}, Lcom/belkin/wemo/cache/CacheManager;->deleteAllDeviceFromDB(ZZZ)V

    .line 947
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearAll()V

    .line 948
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->initControlPoint()V

    .line 950
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 952
    new-instance v0, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 953
    .local v0, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v1, "cache.db"

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 956
    .end local v0    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_0
    return-void
.end method

.method public resetInsightDrawerState()V
    .locals 1

    .prologue
    .line 4795
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->resetInsightDrawerStates(Landroid/content/Context;)V

    .line 4796
    return-void
.end method

.method public declared-synchronized resetOfflineLEDCount()V
    .locals 2

    .prologue
    .line 7391
    monitor-enter p0

    :try_start_0
    const-string v0, "DeviceListManager"

    const-string v1, "LED Status Tracking: Offline LED Count RESET"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7392
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->offlineLEDCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7393
    monitor-exit p0

    return-void

    .line 7391
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public resetPlugin(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "key"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 6017
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 6018
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v3

    .line 6019
    .local v3, "localDevice":Lorg/cybergarage/upnp/Device;
    const-string v6, "ReSetup"

    invoke-virtual {v3, v6}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 6020
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    const-string v6, "Reset"

    invoke-virtual {v0, v6, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 6021
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v4

    .line 6022
    .local v4, "response":Ljava/lang/String;
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Response : reset option : UDN : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6023
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 6035
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return v5

    .line 6026
    .restart local v0    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .restart local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .restart local v4    # "response":Ljava/lang/String;
    :cond_1
    sget-object v6, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ERROR:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_0

    .line 6030
    const/4 v5, 0x1

    goto :goto_0

    .line 6032
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v3    # "localDevice":Lorg/cybergarage/upnp/Device;
    .end local v4    # "response":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 6033
    .local v2, "ex":Ljava/lang/Exception;
    const-string v6, "DeviceListManager"

    const-string v7, "Exception in resetPlugin ex:"

    invoke-static {v6, v7, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public resetThreshold(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 10
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    const/4 v0, 0x0

    .line 6235
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 6236
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "missing UDN udn: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6256
    :goto_0
    return v0

    .line 6240
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 6241
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;

    const-string v3, "resetThreshold"

    move-object v1, p1

    move-object v2, p2

    move-object v4, p0

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetThresholdRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 6256
    :goto_1
    const/4 v0, 0x1

    goto :goto_0

    .line 6244
    :cond_1
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 6245
    .local v8, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 6247
    .local v6, "attribute":Lorg/json/JSONObject;
    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    const-string v2, "8000"

    invoke-virtual {v6, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6252
    new-instance v7, Lcom/belkin/wemo/cache/cloud/CloudRequestResetPowerThreshold;

    const-string v0, "SetPowerThreshold"

    invoke-direct {v7, p0, v8, v0, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetPowerThreshold;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 6253
    .local v7, "cloudRequest":Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;

    const-string v1, "8000"

    invoke-direct {v0, p1, p2, v1}, Lcom/belkin/wemo/cache/devicelist/listener/ResetThresholdRemoteListener;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;->setOnCloudRequestCompletedListener(Lcom/belkin/wemo/cache/cloud/AbstractCloudRequest$OnCloudRequestCompleted;)V

    .line 6254
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_1

    .line 6248
    .end local v7    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;
    :catch_0
    move-exception v9

    .line 6249
    .local v9, "e":Lorg/json/JSONException;
    const-string v1, "DeviceListManager"

    const-string v2, "JSONException while setting default power threshold to 8000"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public resetUsageData(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 11
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 6097
    const/4 v9, 0x0

    .line 6098
    .local v9, "isProcessing":Z
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 6099
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "udn empty or null resetUsageData udn:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6100
    const/4 v0, 0x0

    .line 6119
    :goto_0
    return v0

    .line 6103
    :cond_0
    invoke-virtual {p0, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDBByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v7

    .line 6106
    .local v7, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 6107
    new-instance v10, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;

    invoke-direct {v10, p1, p2, p0, p3}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    .line 6108
    .local v10, "oDLMUsageData":Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    invoke-virtual {v0, v10}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 6114
    .end local v10    # "oDLMUsageData":Lcom/belkin/wemo/cache/devicelist/runnable/ResetUsageDataRunnable;
    :goto_1
    const/4 v9, 0x1

    :goto_2
    move v0, v9

    .line 6119
    goto :goto_0

    .line 6110
    :cond_1
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v6, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6111
    .local v6, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    const/4 v1, 0x1

    new-array v5, v1, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "reset_usage_data"

    aput-object v2, v5, v1

    move-object v1, p0

    move-object v2, p3

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestResetUsageData;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v6, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 6115
    .end local v6    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :catch_0
    move-exception v8

    .line 6116
    .local v8, "ex":Ljava/lang/Exception;
    const-string v0, "DeviceListManager"

    const-string v1, "Exception in ResetUsageData ex: "

    invoke-static {v0, v1, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 6117
    const/4 v9, 0x0

    goto :goto_2
.end method

.method public resetWiFi(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)Z
    .locals 6
    .param p1, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;
    .param p2, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;
    .param p3, "udn"    # Ljava/lang/String;
    .param p4, "deviceInformation"    # Lorg/json/JSONObject;
    .param p5, "stateData"    # Lorg/json/JSONObject;

    .prologue
    .line 6069
    const/4 v1, 0x0

    .line 6070
    .local v1, "isProcessing":Z
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 6072
    :try_start_0
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 6073
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "missing UDN resetWiFi udn: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6074
    const/4 v1, 0x0

    .line 6077
    :cond_0
    new-instance v2, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;

    invoke-direct {v2, p1, p2, p0, p3}, Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;-><init>(Lcom/belkin/wemo/cache/devicelist/callback/PluginResultErrorCallback;Lcom/belkin/wemo/cache/devicelist/callback/PluginResultSuccessCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;)V

    .line 6078
    .local v2, "oResetWifi":Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    invoke-virtual {v3, v2}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 6079
    const/4 v1, 0x1

    .line 6086
    .end local v2    # "oResetWifi":Lcom/belkin/wemo/cache/devicelist/runnable/ResetWifiRunnable;
    :cond_1
    :goto_0
    return v1

    .line 6080
    :catch_0
    move-exception v0

    .line 6081
    .local v0, "ex":Ljava/lang/Exception;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Exception in resetWiFi ex: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6082
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 6083
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public restartCloudPeriodicUpdate()V
    .locals 6

    .prologue
    .line 782
    const-string v0, "DeviceListManager"

    const-string v1, "RESTARTING CLOUD PERIODIC UPDATE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 783
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 784
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 787
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-nez v0, :cond_1

    .line 788
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    .line 790
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$4;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$4;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    const-wide/16 v2, 0x0

    const-wide/32 v4, 0xea60

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 797
    :cond_1
    return-void
.end method

.method public rotateCameraIcon(Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 11
    .param p1, "iconUri"    # Landroid/net/Uri;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 6547
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 6550
    :try_start_0
    new-instance v8, Landroid/media/ExifInterface;

    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Landroid/media/ExifInterface;-><init>(Ljava/lang/String;)V

    .line 6551
    .local v8, "exif":Landroid/media/ExifInterface;
    const-string v0, "Orientation"

    const/4 v1, 0x1

    invoke-virtual {v8, v0, v1}, Landroid/media/ExifInterface;->getAttributeInt(Ljava/lang/String;I)I

    move-result v9

    .line 6553
    .local v9, "exifOrientation":I
    packed-switch v9, :pswitch_data_0

    .line 6564
    :pswitch_0
    const/4 v10, 0x0

    .line 6568
    .local v10, "orientation":I
    :goto_0
    if-eqz v10, :cond_0

    .line 6569
    new-instance v5, Landroid/graphics/Matrix;

    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 6570
    .local v5, "matrix":Landroid/graphics/Matrix;
    int-to-float v0, v10

    invoke-virtual {v5, v0}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 6571
    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    const/4 v6, 0x1

    move-object v0, p2

    invoke-static/range {v0 .. v6}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p2

    .line 6577
    .end local v5    # "matrix":Landroid/graphics/Matrix;
    .end local v8    # "exif":Landroid/media/ExifInterface;
    .end local v9    # "exifOrientation":I
    .end local v10    # "orientation":I
    :cond_0
    :goto_1
    return-object p2

    .line 6555
    .restart local v8    # "exif":Landroid/media/ExifInterface;
    .restart local v9    # "exifOrientation":I
    :pswitch_1
    const/16 v10, 0x5a

    .line 6556
    .restart local v10    # "orientation":I
    goto :goto_0

    .line 6558
    .end local v10    # "orientation":I
    :pswitch_2
    const/16 v10, 0xb4

    .line 6559
    .restart local v10    # "orientation":I
    goto :goto_0

    .line 6561
    .end local v10    # "orientation":I
    :pswitch_3
    const/16 v10, 0x10e

    .line 6562
    .restart local v10    # "orientation":I
    goto :goto_0

    .line 6573
    .end local v8    # "exif":Landroid/media/ExifInterface;
    .end local v9    # "exifOrientation":I
    .end local v10    # "orientation":I
    :catch_0
    move-exception v7

    .line 6574
    .local v7, "e":Ljava/io/IOException;
    const-string v0, "DeviceListManager"

    const-string v1, "rotateCameraIcon: IOException while creating ExifInterface: "

    invoke-static {v0, v1, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 6553
    :pswitch_data_0
    .packed-switch 0x3
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_1
        :pswitch_0
        :pswitch_3
    .end packed-switch
.end method

.method public rotateGalleryIcon(Landroid/net/Uri;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 13
    .param p1, "iconUri"    # Landroid/net/Uri;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 6504
    if-eqz p1, :cond_2

    .line 6505
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v0

    .line 6506
    .local v0, "contentResolver":Landroid/content/ContentResolver;
    if-nez p2, :cond_0

    .line 6509
    :try_start_0
    invoke-static {v0, p1}, Landroid/provider/MediaStore$Images$Media;->getBitmap(Landroid/content/ContentResolver;Landroid/net/Uri;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object p2

    .line 6517
    :cond_0
    :goto_0
    if-eqz p2, :cond_2

    .line 6518
    const/4 v12, 0x0

    .line 6519
    .local v12, "orientation":I
    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v3, "orientation"

    aput-object v3, v2, v1

    .line 6523
    .local v2, "columns":[Ljava/lang/String;
    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v10

    .line 6525
    .local v10, "cursor":Landroid/database/Cursor;
    if-eqz v10, :cond_1

    invoke-interface {v10}, Landroid/database/Cursor;->moveToFirst()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 6526
    const-string v1, "orientation"

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v10, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 6527
    const-string v1, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "rotateGalleryIcon: Image Orientation "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v1, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6530
    :cond_1
    if-eqz v12, :cond_2

    .line 6531
    new-instance v8, Landroid/graphics/Matrix;

    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 6532
    .local v8, "matrix":Landroid/graphics/Matrix;
    int-to-float v1, v12

    invoke-virtual {v8, v1}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 6533
    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    const/4 v9, 0x1

    move-object v3, p2

    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    move-result-object p2

    .line 6537
    .end local v0    # "contentResolver":Landroid/content/ContentResolver;
    .end local v2    # "columns":[Ljava/lang/String;
    .end local v8    # "matrix":Landroid/graphics/Matrix;
    .end local v10    # "cursor":Landroid/database/Cursor;
    .end local v12    # "orientation":I
    :cond_2
    return-object p2

    .line 6510
    .restart local v0    # "contentResolver":Landroid/content/ContentResolver;
    :catch_0
    move-exception v11

    .line 6511
    .local v11, "e":Ljava/io/FileNotFoundException;
    const-string v1, "DeviceListManager"

    const-string v3, "rotateGalleryIcon: FileNotFoundException while creating bitmap: "

    invoke-static {v1, v3, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 6512
    .end local v11    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v11

    .line 6513
    .local v11, "e":Ljava/io/IOException;
    const-string v1, "DeviceListManager"

    const-string v3, "rotateGalleryIcon: IOException while creating bitmap: "

    invoke-static {v1, v3, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public saveEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .locals 2
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 6477
    const-string v0, ""

    .line 6478
    .local v0, "path":Ljava/lang/String;
    if-eqz p1, :cond_0

    .line 6479
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v1}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/storage/FileStorage;->storeEditedIcon(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object v0

    .line 6481
    :cond_0
    return-object v0
.end method

.method public sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 3420
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 3421
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->listenersSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;

    .line 3422
    .local v1, "listener":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
    if-eqz v1, :cond_0

    .line 3423
    const-string v2, "Listeners"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "in sendNotification :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3424
    invoke-interface {v1, p1, p2, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3428
    .end local v0    # "i$":Ljava/util/Iterator;
    .end local v1    # "listener":Lcom/belkin/wemo/cache/devicelist/DeviceListManager$NotificationListenerDLM;
    :cond_1
    const-string v2, "Listeners"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "listenersSet is empty cannot send notification for udn:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " event:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3431
    :cond_2
    return-void
.end method

.method public setAndAddNewLocationCallback(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "homeId"    # Ljava/lang/String;
    .param p2, "arpMac"    # Ljava/lang/String;
    .param p3, "ssid"    # Ljava/lang/String;
    .param p4, "locationName"    # Ljava/lang/String;

    .prologue
    .line 6775
    if-eqz p1, :cond_2

    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    .line 6776
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setAndAddNewLocation success homeId: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " arpMac: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " ssid: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " locationName: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6777
    new-instance v4, Lcom/belkin/wemo/cache/location/Location;

    invoke-direct {v4, p1, p4}, Lcom/belkin/wemo/cache/location/Location;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 6778
    .local v4, "location":Lcom/belkin/wemo/cache/location/Location;
    new-instance v3, Ljava/util/HashSet;

    invoke-direct {v3}, Ljava/util/HashSet;-><init>()V

    .line 6779
    .local v3, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v3, p3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6780
    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/location/Location;->setSsids(Ljava/util/Set;)V

    .line 6782
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 6783
    .local v0, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    invoke-virtual {v0, p2}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 6784
    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/location/Location;->setArpMacs(Ljava/util/Set;)V

    .line 6786
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getCurrentLocationHomeId()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    if-nez v5, :cond_1

    .line 6788
    :cond_0
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDefaultLocation()Lcom/belkin/wemo/cache/location/Location;

    move-result-object v1

    .line 6789
    .local v1, "defaultLocation":Lcom/belkin/wemo/cache/location/Location;
    const-string v5, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "setAndAddNewLocation adding default location: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6790
    if-eqz v1, :cond_1

    .line 6791
    invoke-virtual {p0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addLocationDB(Lcom/belkin/wemo/cache/location/Location;)V

    .line 6794
    .end local v1    # "defaultLocation":Lcom/belkin/wemo/cache/location/Location;
    :cond_1
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addLocationDB(Lcom/belkin/wemo/cache/location/Location;)V

    .line 6796
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v5, p1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->setCurrentLocationHomeId(Ljava/lang/String;)V

    .line 6797
    const/4 v5, 0x1

    invoke-static {v5}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 6798
    const-string v5, "location_creation_success"

    const-string v6, ""

    invoke-virtual {p0, v5, v6, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6806
    .end local v0    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v3    # "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v4    # "location":Lcom/belkin/wemo/cache/location/Location;
    :goto_0
    return-void

    .line 6800
    :cond_2
    const-string v5, "DeviceListManager"

    const-string v6, "setAndAddNewLocationCallback failed"

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6801
    const-string v5, "location_creation_failed"

    const-string v6, ""

    invoke-virtual {p0, v5, v6, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 6803
    :catch_0
    move-exception v2

    .line 6804
    .local v2, "e":Ljava/lang/Exception;
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 4
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keys"    # [Ljava/lang/String;
    .param p3, "values"    # [Ljava/lang/String;

    .prologue
    .line 3875
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "in setArguments::"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "::values len:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, p3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3876
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 3877
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 3878
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "setArguments key:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p2, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "::values:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    aget-object v3, p3, v0

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3879
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 3877
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 3882
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method public setArpMacSSIDsFromCloud(Lorg/json/JSONArray;Lorg/json/JSONArray;)V
    .locals 10
    .param p1, "ssidsArray"    # Lorg/json/JSONArray;
    .param p2, "arpMacArray"    # Lorg/json/JSONArray;

    .prologue
    .line 3178
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "ACTION_SET_SSID ssid: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " arpMac: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3179
    new-instance v4, Ljava/util/HashSet;

    invoke-direct {v4}, Ljava/util/HashSet;-><init>()V

    .line 3180
    .local v4, "homeSSIDs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v5, 0x0

    .local v5, "i":I
    :goto_0
    invoke-virtual {p1}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_0

    .line 3182
    :try_start_0
    invoke-virtual {p1, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3180
    :goto_1
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 3183
    :catch_0
    move-exception v1

    .line 3184
    .local v1, "e":Lorg/json/JSONException;
    const-string v7, "DeviceListManager"

    const-string v8, " :: Exception during homeSSID adding :: exception is "

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_1

    .line 3187
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v7, v4}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mergeHomeSsid(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v3

    .line 3188
    .local v3, "groupSSid":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setArpMacSSIDsFromCloud: groupSSid: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3189
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v7, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setHomeSSIDs(Ljava/util/Set;)Z

    .line 3190
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lez v7, :cond_2

    .line 3192
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 3193
    .local v0, "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    const/4 v5, 0x0

    :goto_2
    invoke-virtual {p2}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-ge v5, v7, :cond_1

    .line 3195
    :try_start_1
    invoke-virtual {p2, v5}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_1

    .line 3193
    :goto_3
    add-int/lit8 v5, v5, 0x1

    goto :goto_2

    .line 3196
    :catch_1
    move-exception v1

    .line 3197
    .restart local v1    # "e":Lorg/json/JSONException;
    const-string v7, "DeviceListManager"

    const-string v8, " :: Exception during arpMac adding :: exception is "

    invoke-static {v7, v8, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_3

    .line 3200
    .end local v1    # "e":Lorg/json/JSONException;
    :cond_1
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getARPMacs()Ljava/util/Set;

    move-result-object v6

    .line 3201
    .local v6, "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v7, v6, v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->mergeArpMacs(Ljava/util/Set;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    .line 3202
    .local v2, "groupArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "setArpMacSSIDsFromCloud: groupArpMacs: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3203
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v7, v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setARPMacs(Ljava/util/Set;)Z

    .line 3205
    .end local v0    # "arpMacs":Ljava/util/HashSet;, "Ljava/util/HashSet<Ljava/lang/String;>;"
    .end local v2    # "groupArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    .end local v6    # "storedArpMacs":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    :cond_2
    return-void
.end method

.method public setAttributeState(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 4496
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    .line 4497
    .local v5, "wemodevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v5, :cond_2

    .line 4498
    const/4 v0, 0x0

    .line 4500
    .local v0, "argumet":[Ljava/lang/String;
    :try_start_0
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 4501
    .local v2, "d":Lorg/cybergarage/upnp/Device;
    if-nez v2, :cond_0

    .line 4502
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v6

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v2

    .line 4504
    :cond_0
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "wemodevice.getDevice()::"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " UDN: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " d: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 4506
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 4507
    const/4 v6, 0x1

    new-array v1, v6, [Ljava/lang/String;

    const/4 v6, 0x0

    invoke-direct {p0, p2, v5}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->createAttributeList(Lorg/json/JSONObject;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v1, v6

    .end local v0    # "argumet":[Ljava/lang/String;
    .local v1, "argumet":[Ljava/lang/String;
    move-object v0, v1

    .line 4512
    .end local v1    # "argumet":[Ljava/lang/String;
    .restart local v0    # "argumet":[Ljava/lang/String;
    :cond_1
    new-instance v3, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v6, p1, p2}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 4513
    .local v3, "deviceAttributeSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v6

    invoke-virtual {v6, v3}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4519
    .end local v0    # "argumet":[Ljava/lang/String;
    .end local v2    # "d":Lorg/cybergarage/upnp/Device;
    .end local v3    # "deviceAttributeSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;
    :cond_2
    :goto_0
    return-void

    .line 4514
    .restart local v0    # "argumet":[Ljava/lang/String;
    :catch_0
    move-exception v4

    .line 4515
    .local v4, "e":Ljava/lang/Exception;
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Exception setAttributeState:: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v4}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 4516
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public setBinaryState(Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 3724
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "setBinaryState: network mode:: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3725
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 3726
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v2

    .line 3728
    .local v2, "wemodevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v2, :cond_0

    .line 3729
    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    aput-object p1, v4, v6

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-direct {v1, v3, v4}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;-><init>(Landroid/content/Context;[Ljava/lang/Object;)V

    .line 3730
    .local v1, "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v3

    invoke-virtual {v3, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 3740
    .end local v1    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    .end local v2    # "wemodevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    :goto_0
    return-void

    .line 3735
    :cond_1
    invoke-virtual {p0, p2, v6, v7, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 3737
    .local v0, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {p0, v3, v4, v5, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->makeStateChangeRequest(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setBlobStorage(Ljava/lang/String;Lorg/json/JSONObject;)Z
    .locals 20
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "data"    # Lorg/json/JSONObject;

    .prologue
    .line 5937
    const/16 v19, 0x0

    .line 5938
    .local v19, "isProcessing":Z
    invoke-static/range {p1 .. p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 5939
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "missing UDN udn: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5940
    const/4 v1, 0x0

    .line 5959
    :goto_0
    return v1

    .line 5944
    :cond_0
    :try_start_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 5945
    new-instance v3, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v3, v1}, Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;-><init>(Landroid/content/Context;)V

    .line 5946
    .local v3, "callback":Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 5947
    .local v7, "localDevice":Lorg/cybergarage/upnp/Device;
    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;

    const-string v2, "setBlobStorage"

    move-object/from16 v4, p0

    move-object/from16 v5, p1

    move-object/from16 v6, p2

    invoke-direct/range {v1 .. v7}, Lcom/belkin/wemo/cache/devicelist/runnable/BlobStorageRunnable;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Ljava/lang/String;Lorg/json/JSONObject;Lorg/cybergarage/upnp/Device;)V

    invoke-static {v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 5948
    const/16 v19, 0x1

    .end local v3    # "callback":Lcom/belkin/wemo/cache/devicelist/callback/GetSetBlobStorageCallback;
    .end local v7    # "localDevice":Lorg/cybergarage/upnp/Device;
    :goto_1
    move/from16 v1, v19

    .line 5959
    goto :goto_0

    .line 5950
    :cond_1
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v17

    .line 5951
    .local v17, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v16, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v16

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 5952
    .local v16, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;

    sget-object v10, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {v17 .. v17}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v13

    const-string v14, "setBlobStorage"

    move-object/from16 v9, p0

    move-object/from16 v11, p1

    move-object/from16 v15, p2

    invoke-direct/range {v8 .. v15}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetSetBlobStorage;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v16

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 5955
    .end local v16    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v17    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v18

    .line 5956
    .local v18, "ex":Ljava/lang/Exception;
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Exception in getBlobStorage udn: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    move-object/from16 v0, p1

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setBulbType(Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V
    .locals 13
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "bulbType"    # Ljava/lang/String;
    .param p3, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;

    .prologue
    .line 1651
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1652
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    invoke-virtual {v1, p1}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    .line 1653
    .local v9, "device":Lorg/cybergarage/upnp/Device;
    if-nez v9, :cond_0

    .line 1654
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 1655
    .local v8, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v9

    .line 1658
    .end local v8    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_0
    if-eqz v9, :cond_3

    .line 1659
    const-string v1, "SetBulbType"

    invoke-virtual {v9, v1}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v7

    .line 1660
    .local v7, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v7, :cond_2

    .line 1661
    const-string v1, "bulbType"

    invoke-virtual {v7, v1, p2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1662
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v11

    new-instance v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;

    move-object/from16 v0, p4

    invoke-direct {v12, p0, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$12;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;

    move-object v2, p0

    move-object/from16 v3, p3

    move-object v4, p1

    move-object v5, p2

    move-object/from16 v6, p4

    invoke-direct/range {v1 .. v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$13;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeSuccessCallback;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;)V

    invoke-virtual {v11, v7, v12, v1}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 1725
    .end local v7    # "action":Lorg/cybergarage/upnp/Action;
    .end local v9    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    :goto_0
    return-void

    .line 1703
    .restart local v7    # "action":Lorg/cybergarage/upnp/Action;
    .restart local v9    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    const-string v10, "setBulbType: SetBulbType ACTION IS NULL"

    .line 1704
    .local v10, "error":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    invoke-static {v1, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1705
    if-eqz p4, :cond_1

    .line 1706
    move-object/from16 v0, p4

    invoke-interface {v0, v10}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;->onSetBulbTypeFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1710
    .end local v7    # "action":Lorg/cybergarage/upnp/Action;
    .end local v10    # "error":Ljava/lang/String;
    :cond_3
    const-string v10, "setBulbType: Control Point object is NULL"

    .line 1711
    .restart local v10    # "error":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    invoke-static {v1, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1712
    if-eqz p4, :cond_1

    .line 1713
    move-object/from16 v0, p4

    invoke-interface {v0, v10}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;->onSetBulbTypeFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1717
    .end local v9    # "device":Lorg/cybergarage/upnp/Device;
    .end local v10    # "error":Ljava/lang/String;
    :cond_4
    const-string v10, "setBulbType: SetBulbType API not suppoted in REMOTE mode."

    .line 1718
    .restart local v10    # "error":Ljava/lang/String;
    const-string v1, "DeviceListManager"

    invoke-static {v1, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1719
    if-eqz p4, :cond_1

    .line 1720
    move-object/from16 v0, p4

    invoke-interface {v0, v10}, Lcom/belkin/wemo/cache/devicelist/callback/SetBulbTypeErrorCallback;->onSetBulbTypeFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setCallbackListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V
    .locals 2
    .param p1, "act"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .prologue
    .line 800
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    .line 801
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->setCallbackListener(Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;)V

    .line 802
    return-void
.end method

.method public setCurrentSSID(Ljava/lang/String;)V
    .locals 0
    .param p1, "currentSSID"    # Ljava/lang/String;

    .prologue
    .line 826
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->currentSSID:Ljava/lang/String;

    .line 827
    return-void
.end method

.method public setDataStoreOnCloud(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;Ljava/lang/String;)V
    .locals 8
    .param p1, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .param p2, "bridgeUDN"    # Ljava/lang/String;
    .param p3, "emergencyContacts"    # Ljava/lang/String;

    .prologue
    .line 6909
    const-string v0, "DeviceListManager"

    const-string v1, " :: setDataStoreOnCloud :: is called"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6910
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationByUDNFromMemory(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v6

    .line 6911
    .local v6, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v6, :cond_1

    .line 6912
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v3

    .line 6913
    .local v3, "pluginID":Ljava/lang/String;
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    .line 6914
    .local v4, "mac":Ljava/lang/String;
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "pluginID:: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " mac:: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6915
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 6916
    new-instance v7, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v7, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6917
    .local v7, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDataStoreOnLink;-><init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v7, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6928
    .end local v3    # "pluginID":Ljava/lang/String;
    .end local v4    # "mac":Ljava/lang/String;
    .end local v7    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 6920
    .restart local v3    # "pluginID":Ljava/lang/String;
    .restart local v4    # "mac":Ljava/lang/String;
    :cond_0
    const-string v0, "DeviceListManager"

    const-string v1, "Plugin and mac is empty"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6921
    invoke-interface {p1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0

    .line 6925
    .end local v3    # "pluginID":Ljava/lang/String;
    .end local v4    # "mac":Ljava/lang/String;
    :cond_1
    const-string v0, "DeviceListManager"

    const-string v1, "No device Information is found"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6926
    invoke-interface {p1}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method

.method public setDeviceInactive(Ljava/lang/String;)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 4718
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceInactive(Ljava/lang/String;)V

    .line 4719
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4720
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 4721
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v3, v3, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 4723
    :cond_0
    return-void
.end method

.method public setDeviceInformationToDevicesArray(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V
    .locals 3
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "needUpdateIcon"    # Z

    .prologue
    const/4 v2, 0x1

    .line 6634
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 6635
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1, v2, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 6636
    return-void
.end method

.method public setDeviceInformationToDevicesArrayLocal(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V
    .locals 3
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "needUpdateIcon"    # Z

    .prologue
    const/4 v2, 0x1

    .line 6643
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 6644
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v2, v1, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 6645
    return-void
.end method

.method public setDeviceListFromCloud(Ljava/util/ArrayList;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 16
    .param p2, "source"    # Ljava/lang/String;
    .param p3, "rawXML"    # Ljava/lang/String;
    .param p4, "response"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Z)V"
        }
    .end annotation

    .prologue
    .line 3070
    .local p1, "devList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    if-nez p4, :cond_0

    .line 3071
    const-string v12, "DeviceListManager"

    const-string v13, "DEVICELIST is NULL"

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3072
    invoke-virtual/range {p0 .. p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformation()Ljava/util/ArrayList;

    move-result-object v3

    .line 3073
    .local v3, "cachedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .local v7, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 3074
    .local v4, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v12, 0x0

    invoke-virtual {v4, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 3075
    const/4 v12, 0x1

    invoke-virtual {v4, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 3076
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v12, v4, v13, v14, v15}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 3077
    const-string v12, "update"

    const-string v13, ""

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 3082
    .end local v3    # "cachedDevices":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v7    # "i$":Ljava/util/Iterator;
    :cond_0
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "XML IS ::"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    move-object/from16 v0, p3

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3084
    const-string v12, "groupSSIDs"

    const-string v13, "ssid"

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v10

    .line 3085
    .local v10, "ssidArray":Lorg/json/JSONArray;
    const-string v12, "groupArpMacs"

    const-string v13, "arpMac"

    move-object/from16 v0, p3

    invoke-static {v0, v12, v13}, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;->parseResponseFromCloudByTagName(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 3086
    .local v1, "arpArray":Lorg/json/JSONArray;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "setDeviceListFromCloud: ssidArray: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " arpArray: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3087
    if-eqz v10, :cond_1

    if-eqz v1, :cond_1

    .line 3088
    move-object/from16 v0, p0

    invoke-virtual {v0, v10, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArpMacSSIDsFromCloud(Lorg/json/JSONArray;Lorg/json/JSONArray;)V

    .line 3092
    :cond_1
    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v7

    .restart local v7    # "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 3093
    .restart local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v12, "RemoteMode:"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, " adding dev "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "  "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIsDiscovered()Z

    move-result v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3094
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Lcom/belkin/wemo/cache/utils/IsDevice;->Crockpot(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    .line 3095
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    .line 3096
    .local v5, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v2

    .line 3097
    .local v2, "attributeList":Lorg/json/JSONObject;
    const-string v12, "DeviceListManager"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "attributeList"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 3100
    :try_start_0
    const-string v12, "mode"

    invoke-virtual {v2, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 3101
    .local v9, "modeObj":Lorg/json/JSONObject;
    const-string v12, "value"

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v13

    invoke-virtual {v9, v12, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 3102
    const-string v12, "mode"

    invoke-virtual {v2, v12, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 3103
    invoke-virtual {v4, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3110
    .end local v2    # "attributeList":Lorg/json/JSONObject;
    .end local v5    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v9    # "modeObj":Lorg/json/JSONObject;
    :cond_2
    :goto_2
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getNeedIconUpdate()Z

    move-result v13

    invoke-virtual {v12, v4, v13}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 3111
    move-object/from16 v0, p0

    iget-object v12, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v13

    const/4 v14, 0x1

    invoke-virtual {v12, v13, v14}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceDiscovered(Ljava/lang/String;Z)V

    .line 3112
    const/4 v11, 0x0

    .line 3115
    .local v11, "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v11

    .line 3116
    if-eqz v11, :cond_4

    .line 3117
    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v12

    invoke-virtual {v4, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 3119
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x1

    invoke-virtual {v12, v4, v13, v14, v15}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 3120
    const/4 v11, 0x0

    .line 3134
    :cond_3
    :goto_3
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v11

    .line 3135
    if-eqz v11, :cond_5

    .line 3136
    invoke-virtual {v11}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getID()I

    move-result v12

    invoke-virtual {v4, v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setID(I)V

    .line 3138
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v12, v4, v13, v14, v15}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 3139
    const-string v12, "RemoteMode:"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, " sending update notification "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " name:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3140
    const-string v12, "update"

    const-string v13, ""

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3154
    :goto_4
    const/4 v12, 0x0

    sput-boolean v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    .line 3155
    new-instance v12, Ljava/lang/Thread;

    new-instance v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;

    move-object/from16 v0, p0

    invoke-direct {v13, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$20;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v12, v13}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v12}, Ljava/lang/Thread;->start()V

    goto/16 :goto_1

    .line 3104
    .end local v11    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "attributeList":Lorg/json/JSONObject;
    .restart local v5    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :catch_0
    move-exception v6

    .line 3106
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_2

    .line 3123
    .end local v2    # "attributeList":Lorg/json/JSONObject;
    .end local v5    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v6    # "e":Lorg/json/JSONException;
    .restart local v11    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_4
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x0

    invoke-virtual {v12, v4, v13, v14, v15}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 3126
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    const/4 v14, 0x0

    const/4 v15, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14, v15}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    if-nez v12, :cond_3

    .line 3128
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    const/4 v14, 0x0

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->addDeviceWithOnlyUDNToLocalOrRemoteTable(Ljava/lang/String;ZZ)V

    goto/16 :goto_3

    .line 3142
    :cond_5
    sget-object v12, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x1

    invoke-virtual {v12, v4, v13, v14, v15}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 3143
    const-string v12, "RemoteMode:"

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, " sending add notification "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, " name:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getFriendlyName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-static {v12, v13}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3144
    const-string v12, "add"

    const-string v13, ""

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    move-object/from16 v0, p0

    invoke-virtual {v0, v12, v13, v14}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_4

    .line 3165
    .end local v4    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v11    # "tempDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_6
    new-instance v8, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v8}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 3166
    .local v8, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v12, "cache.db"

    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v8, v12, v13}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 3168
    .end local v1    # "arpArray":Lorg/json/JSONArray;
    .end local v8    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    .end local v10    # "ssidArray":Lorg/json/JSONArray;
    :cond_7
    return-void
.end method

.method public setDeviceNonReachibility(Z)V
    .locals 0
    .param p1, "deviceNotReachable"    # Z

    .prologue
    .line 246
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->deviceNotReachable:Z

    .line 247
    return-void
.end method

.method public setDevicePairingStatus(Z)V
    .locals 1
    .param p1, "inProgress"    # Z

    .prologue
    .line 1138
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    if-eqz v0, :cond_0

    .line 1139
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->setDevicePairingInProgress(Z)V

    .line 1141
    :cond_0
    return-void
.end method

.method public setDevicePresetCloud(Lorg/json/JSONArray;Lcom/belkin/wemo/callback/SetAndGetActionCallBack;)V
    .locals 3
    .param p1, "presetsInfo"    # Lorg/json/JSONArray;
    .param p2, "callback"    # Lcom/belkin/wemo/callback/SetAndGetActionCallBack;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 6856
    const-string v1, "DeviceListManager"

    const-string v2, " :: setDevicePresetCloud :: is called"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6857
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    .line 6858
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6859
    .local v0, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;

    invoke-direct {v1, p2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSetDevicePreset;-><init>(Lcom/belkin/wemo/callback/SetAndGetActionCallBack;Lorg/json/JSONArray;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 6865
    .end local v0    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 6862
    :cond_0
    const-string v1, "DeviceListManager"

    const-string v2, "JSONArray or SetAndGetActionCallBack is null "

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6863
    invoke-interface {p2}, Lcom/belkin/wemo/callback/SetAndGetActionCallBack;->onError()V

    goto :goto_0
.end method

.method public setDeviceProperties(Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V
    .locals 28
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "device"    # Lorg/json/JSONObject;
    .param p3, "properties"    # Lorg/json/JSONObject;

    .prologue
    .line 6331
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v15

    .line 6332
    .local v15, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v15, :cond_a

    .line 6335
    const/16 v21, 0x0

    .line 6336
    .local v21, "iconLocation":Ljava/lang/String;
    :try_start_0
    const-string v4, "icon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    if-eqz v4, :cond_2

    .line 6337
    const-string v4, "icon"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 6344
    :cond_0
    :goto_0
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "icon file path: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, v21

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6347
    invoke-static/range {v21 .. v21}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 6348
    const/16 v20, 0x0

    .line 6350
    .local v20, "iconBitmap":Landroid/graphics/Bitmap;
    const-string v4, "file:///android_asset/"

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 6353
    const-string v4, "file:///android_asset/"

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v4

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v21

    .line 6354
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v4

    move-object/from16 v0, v21

    invoke-virtual {v4, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v20

    .line 6361
    :goto_1
    if-eqz v20, :cond_1

    .line 6363
    const/16 v23, 0x0

    .line 6365
    .local v23, "newIconVersion":I
    :try_start_1
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_2

    move-result v4

    add-int/lit8 v23, v4, 0x1

    .line 6370
    :goto_2
    :try_start_2
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v4

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v5

    invoke-static/range {v23 .. v23}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, v20

    invoke-virtual {v4, v0, v5, v6}, Lcom/belkin/wemo/storage/FileStorage;->storeRemoteIcon(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    .line 6371
    const-string v4, "icon"

    move-object/from16 v0, p3

    move-object/from16 v1, v21

    invoke-virtual {v0, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6373
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setDeviceProperties(): isZigbee device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6376
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 6377
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v4}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 6378
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6379
    .local v14, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-direct {v4, v5, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;)V

    .line 6384
    .end local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_3
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 6385
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v4

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v16

    .line 6386
    .local v16, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v16, :cond_5

    .line 6387
    move-object/from16 v0, v16

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 6388
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v4

    move-object/from16 v0, v16

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 6389
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object/from16 v0, v16

    invoke-virtual {v4, v0, v5, v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 6417
    .end local v16    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v23    # "newIconVersion":I
    :cond_1
    :goto_4
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_8

    .line 6418
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Ready to set device properties: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual/range {p3 .. p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6419
    new-instance v24, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p3

    move-object/from16 v3, p2

    invoke-direct {v0, v4, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    .line 6420
    .local v24, "oDevicePropertiesSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 6437
    .end local v24    # "oDevicePropertiesSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDevicePropertiesRunnable;
    :goto_5
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v4

    invoke-virtual {v4}, Lcom/belkin/wemo/storage/FileStorage;->emptyTempIconFolder()V

    .line 6448
    .end local v21    # "iconLocation":Ljava/lang/String;
    :goto_6
    return-void

    .line 6340
    .restart local v21    # "iconLocation":Ljava/lang/String;
    :cond_2
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isZigbee(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 6341
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getManufacturerName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/WemoUtils;->getZigbeeIcon(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v21

    goto/16 :goto_0

    .line 6356
    .restart local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    :cond_3
    invoke-static/range {v21 .. v21}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v20

    goto/16 :goto_1

    .line 6366
    .restart local v23    # "newIconVersion":I
    :catch_0
    move-exception v17

    .line 6367
    .local v17, "e":Ljava/lang/NumberFormatException;
    const-string v4, "DeviceListManager"

    const-string v5, "NumberFormatException while incrementing icon version for Device. Possible LED so ignored: "

    move-object/from16 v0, v17

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_2

    goto/16 :goto_2

    .line 6439
    .end local v17    # "e":Ljava/lang/NumberFormatException;
    .end local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v23    # "newIconVersion":I
    :catch_1
    move-exception v18

    .line 6440
    .local v18, "ex":Ljava/io/IOException;
    const-string v4, "DeviceListManager"

    const-string v5, "IOException in setDeviceProperties: "

    move-object/from16 v0, v18

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_6

    .line 6381
    .end local v18    # "ex":Ljava/io/IOException;
    .restart local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .restart local v23    # "newIconVersion":I
    :cond_4
    :try_start_3
    const-string v4, "DeviceListManager"

    const-string v5, "setDeviceProperties(): ERROR - Remote access is not enabled."

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_2

    goto/16 :goto_3

    .line 6441
    .end local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v23    # "newIconVersion":I
    :catch_2
    move-exception v18

    .line 6442
    .local v18, "ex":Lorg/json/JSONException;
    const-string v4, "DeviceListManager"

    const-string v5, "JSONException in setDeviceProperties: "

    move-object/from16 v0, v18

    invoke-static {v4, v5, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_6

    .line 6391
    .end local v18    # "ex":Lorg/json/JSONException;
    .restart local v16    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .restart local v23    # "newIconVersion":I
    :cond_5
    :try_start_4
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6392
    .restart local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-direct {v4, v5, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetLEDIcon;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;)V

    goto/16 :goto_4

    .line 6396
    .end local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v16    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_6
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setDeviceProperties(): isLocal: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v6

    invoke-static {v6}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 6397
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_7

    .line 6399
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIP()Ljava/lang/String;

    move-result-object v22

    .line 6400
    .local v22, "ip":Ljava/lang/String;
    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPort()I

    move-result v25

    .line 6403
    .local v25, "port":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "http://"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move-object/from16 v0, v22

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ":"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, v25

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "/icon.jpg"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v27

    .line 6405
    .local v27, "url":Ljava/lang/String;
    new-instance v26, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v26

    move-object/from16 v1, p1

    move-object/from16 v2, v27

    move-object/from16 v3, v21

    invoke-direct {v0, v4, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 6406
    .local v26, "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v26

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto/16 :goto_4

    .line 6408
    .end local v22    # "ip":Ljava/lang/String;
    .end local v25    # "port":I
    .end local v26    # "runnable":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;
    .end local v27    # "url":Ljava/lang/String;
    :cond_7
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6409
    .restart local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v6

    move-object/from16 v0, p1

    move-object/from16 v1, v21

    invoke-direct {v4, v5, v0, v6, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceIcon;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;)V

    goto/16 :goto_4

    .line 6422
    .end local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v20    # "iconBitmap":Landroid/graphics/Bitmap;
    .end local v23    # "newIconVersion":I
    :cond_8
    new-instance v19, Lorg/json/JSONObject;

    invoke-direct/range {v19 .. v19}, Lorg/json/JSONObject;-><init>()V

    .line 6423
    .local v19, "extraObj":Lorg/json/JSONObject;
    const-string v4, "notificationName"

    const-string v5, "set_properties"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6424
    const-string v4, "bridgeUDN"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 6425
    .local v13, "bridgeUDN":Ljava/lang/String;
    const-string v4, "friendlyName"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/String;

    .line 6426
    .local v10, "friendlyName":Ljava/lang/String;
    invoke-virtual {v13}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_9

    .line 6427
    const-string v4, "bridgeudn"

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6428
    move-object/from16 v0, p0

    invoke-virtual {v0, v13}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromDevicesArray(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v12

    .line 6429
    .local v12, "bridgeDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v4, "bridgeMacAddress"

    invoke-virtual {v12}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v5

    move-object/from16 v0, v19

    invoke-virtual {v0, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 6431
    .end local v12    # "bridgeDev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_9
    new-instance v14, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 6432
    .restart local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v15}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v9

    const/4 v5, 0x1

    new-array v11, v5, [Ljava/lang/Object;

    const/4 v5, 0x0

    aput-object v19, v11, v5

    move-object/from16 v5, p0

    move-object/from16 v7, p1

    invoke-direct/range {v4 .. v11}, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeFriendlyName;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {v14, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_2

    goto/16 :goto_5

    .line 6446
    .end local v10    # "friendlyName":Ljava/lang/String;
    .end local v13    # "bridgeUDN":Ljava/lang/String;
    .end local v14    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v19    # "extraObj":Lorg/json/JSONObject;
    .end local v21    # "iconLocation":Ljava/lang/String;
    :cond_a
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "setDeviceProperties: DeviceInformation Object is NULL. UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object/from16 v0, p1

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_6
.end method

.method public setDeviceState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 33
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "attribute"    # Lorg/json/JSONObject;
    .param p3, "type"    # Ljava/lang/String;

    .prologue
    .line 3502
    :try_start_0
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " capability values: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "; Type: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p3

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3503
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " in setDeviceState "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3504
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " NetworkMode. Is Local: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3506
    move-object/from16 v0, p0

    move-object/from16 v1, p3

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "Maker"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 3507
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 3508
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling deviceAttriuteSetter: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3509
    new-instance v24, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v24

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-direct {v0, v4, v1, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    .line 3510
    .local v24, "deviceAttributeSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v24

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 3658
    .end local v24    # "deviceAttributeSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceAttributeRunnable;
    :cond_1
    :goto_0
    return-void

    .line 3512
    :cond_2
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3513
    .local v21, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v4, v8, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestChangeAttributes;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 3653
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :catch_0
    move-exception v27

    .line 3654
    .local v27, "exception":Ljava/lang/Exception;
    const-string v4, "DeviceListManager"

    const-string v8, "Error in setting the device state: "

    move-object/from16 v0, v27

    invoke-static {v4, v8, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 3516
    .end local v27    # "exception":Ljava/lang/Exception;
    :cond_3
    :try_start_1
    const-string v4, "crockpot"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    .line 3517
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_4

    .line 3518
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling SetDeviceStateRunnable in crockpot: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3519
    new-instance v25, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "mode"

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object p1, v8, v9

    const/4 v9, 0x2

    const-string v10, "time"

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v8}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;-><init>(Landroid/content/Context;[Ljava/lang/Object;)V

    .line 3520
    .local v25, "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto :goto_0

    .line 3522
    .end local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    :cond_4
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3523
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v4, v8, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 3525
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_5
    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_d

    .line 3526
    const-string v4, "DeviceListManager"

    const-string v8, "DeviceType:zigbee "

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3527
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v23

    .line 3528
    .local v23, "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "device:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, v23

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3529
    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_1

    .line 3530
    const-string v5, ""

    .line 3531
    .local v5, "capabilityID":Ljava/lang/String;
    const-string v6, ""

    .line 3532
    .local v6, "capabilityName":Ljava/lang/String;
    const-string v7, ""

    .line 3533
    .local v7, "capabilityValue":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v32

    .line 3535
    .local v32, "names":Lorg/json/JSONArray;
    const/16 v29, 0x0

    .local v29, "i":I
    :goto_1
    invoke-virtual/range {v32 .. v32}, Lorg/json/JSONArray;->length()I

    move-result v4

    move/from16 v0, v29

    if-ge v0, v4, :cond_8

    .line 3536
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v4}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v30

    .local v30, "i$":Ljava/util/Iterator;
    :cond_6
    :goto_2
    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_7

    invoke-interface/range {v30 .. v30}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v26

    check-cast v26, Ljava/util/Map$Entry;

    .line 3537
    .local v26, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, v32

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v4, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 3541
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, ","

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 3542
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, ","

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 3543
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface/range {v26 .. v26}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v8, ","

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    goto :goto_2

    .line 3535
    .end local v26    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_7
    add-int/lit8 v29, v29, 0x1

    goto/16 :goto_1

    .line 3550
    .end local v30    # "i$":Ljava/util/Iterator;
    :cond_8
    const-string v4, ","

    invoke-virtual {v5, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9

    .line 3551
    const/4 v4, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v5, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 3553
    :cond_9
    const-string v4, ","

    invoke-virtual {v6, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_a

    .line 3554
    const/4 v4, 0x0

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v6, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    .line 3556
    :cond_a
    const-string v4, ","

    invoke-virtual {v7, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_b

    .line 3557
    const/4 v4, 0x0

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v8

    add-int/lit8 v8, v8, -0x1

    invoke-virtual {v7, v4, v8}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 3560
    :cond_b
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_c

    .line 3561
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling SetZigbeeDeviceStateRunnable: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3562
    new-instance v3, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v8

    const-string v10, "NO"

    move-object/from16 v9, p1

    invoke-direct/range {v3 .. v10}, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3564
    .local v3, "zigbeeDeviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto/16 :goto_0

    .line 3567
    .end local v3    # "zigbeeDeviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;
    :cond_c
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling CloudRequestZigbeeStateChange: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3568
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3569
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getState()I

    move-result v14

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v15

    invoke-virtual/range {v23 .. v23}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v16

    move-object/from16 v10, p1

    move-object v11, v5

    move-object v12, v6

    move-object v13, v7

    invoke-direct/range {v8 .. v16}, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeStateChange;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 3572
    .end local v5    # "capabilityID":Ljava/lang/String;
    .end local v6    # "capabilityName":Ljava/lang/String;
    .end local v7    # "capabilityValue":Ljava/lang/String;
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v23    # "device":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v29    # "i":I
    .end local v32    # "names":Lorg/json/JSONArray;
    :cond_d
    invoke-static/range {p1 .. p1}, Lcom/belkin/wemo/cache/utils/IsDevice;->Insight(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_14

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->BINARY_STATE:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_14

    .line 3573
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_11

    .line 3574
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling SetDeviceStateRunnable: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3575
    new-instance v18, Lorg/json/JSONArray;

    invoke-direct/range {v18 .. v18}, Lorg/json/JSONArray;-><init>()V

    .line 3576
    .local v18, "actionNames":Lorg/json/JSONArray;
    new-instance v17, Lorg/json/JSONArray;

    invoke-direct/range {v17 .. v17}, Lorg/json/JSONArray;-><init>()V

    .line 3577
    .local v17, "actionAttrs":Lorg/json/JSONArray;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e

    .line 3578
    const-string v4, "SetInsightHomeSettings"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3579
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "SetInsightHomeSettings"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3581
    :cond_e
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_f

    .line 3582
    const-string v4, "SetPowerThreshold"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3583
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "SetPowerThreshold"

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3585
    :cond_f
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_10

    .line 3587
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_10

    .line 3588
    const-string v4, "ScheduleDataExport"

    move-object/from16 v0, v18

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3589
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v8, "ScheduleDataExport"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/String;

    const/4 v10, 0x0

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    const/4 v10, 0x1

    sget-object v11, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    aput-object v11, v9, v10

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 3592
    :cond_10
    new-instance v25, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/4 v8, 0x3

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v18, v8, v9

    const/4 v9, 0x1

    aput-object p1, v8, v9

    const/4 v9, 0x2

    aput-object v17, v8, v9

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v8}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;-><init>(Landroid/content/Context;[Ljava/lang/Object;)V

    .line 3593
    .restart local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto/16 :goto_0

    .line 3595
    .end local v17    # "actionAttrs":Lorg/json/JSONArray;
    .end local v18    # "actionNames":Lorg/json/JSONArray;
    .end local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    :cond_11
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3596
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_POWER_THRESHOLD:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12

    .line 3597
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    const-string v9, "SetPowerThreshold"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v4, v0, v8, v9, v1}, Lcom/belkin/wemo/cache/cloud/CRSetPowerThreshold;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 3599
    :cond_12
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_CURRENCY:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_ENERGY_PER_UNIT_COST:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_13

    .line 3600
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CRSetEnergyPerUnitCost;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    const-string v9, "SetInsightHomeSettings"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v4, v0, v8, v9, v1}, Lcom/belkin/wemo/cache/cloud/CRSetEnergyPerUnitCost;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 3602
    :cond_13
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_INTERVAL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 3604
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/JSONConstants;->INSIGHT_EXPORT_EMAIL:Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 3605
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CRScheduleDataExport;

    move-object/from16 v0, p0

    iget-object v8, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    const-string v9, "ScheduleDataExport"

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-direct {v4, v0, v8, v9, v1}, Lcom/belkin/wemo/cache/cloud/CRScheduleDataExport;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 3610
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_14
    const-string v4, "urn:Belkin:device:dimmer:1"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1c

    .line 3611
    const-string v4, "brightness"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_15

    const-string v20, ""

    .line 3612
    .local v20, "brightness":Ljava/lang/String;
    :goto_3
    const-string v4, "fader"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_16

    const-string v28, ""

    .line 3613
    .local v28, "fader":Ljava/lang/String;
    :goto_4
    const-string v4, "binaryState"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_17

    const-string v19, ""

    .line 3615
    .local v19, "binaryState":Ljava/lang/String;
    :goto_5
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_18

    .line 3616
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling SetDeviceStateRunnable for DIMMER: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3617
    new-instance v25, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/4 v8, 0x4

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    aput-object v19, v8, v9

    const/4 v9, 0x1

    aput-object p1, v8, v9

    const/4 v9, 0x2

    aput-object v20, v8, v9

    const/4 v9, 0x3

    aput-object v28, v8, v9

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v8}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;-><init>(Landroid/content/Context;[Ljava/lang/Object;)V

    .line 3618
    .restart local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto/16 :goto_0

    .line 3611
    .end local v19    # "binaryState":Ljava/lang/String;
    .end local v20    # "brightness":Ljava/lang/String;
    .end local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    .end local v28    # "fader":Ljava/lang/String;
    :cond_15
    const-string v4, "brightness"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    goto :goto_3

    .line 3612
    .restart local v20    # "brightness":Ljava/lang/String;
    :cond_16
    const-string v4, "fader"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v28

    goto :goto_4

    .line 3613
    .restart local v28    # "fader":Ljava/lang/String;
    :cond_17
    const-string v4, "binaryState"

    move-object/from16 v0, p2

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    goto :goto_5

    .line 3620
    .restart local v19    # "binaryState":Ljava/lang/String;
    :cond_18
    const/16 v22, 0x0

    .line 3621
    .local v22, "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    invoke-static/range {v19 .. v19}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1a

    .line 3623
    new-instance v22, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;

    .end local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const-string v8, "status"

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, v19

    invoke-direct {v0, v4, v1, v8, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3630
    .restart local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    :cond_19
    :goto_6
    if-eqz v22, :cond_1

    .line 3631
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3632
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual/range {v21 .. v22}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 3624
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :cond_1a
    invoke-static/range {v20 .. v20}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1b

    .line 3625
    new-instance v22, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;

    .end local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const-string v8, "brightness"

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, v20

    invoke-direct {v0, v4, v1, v8, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    goto :goto_6

    .line 3626
    :cond_1b
    invoke-static/range {v28 .. v28}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_19

    .line 3627
    new-instance v22, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;

    .end local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const-string v8, "fader"

    move-object/from16 v0, v22

    move-object/from16 v1, p1

    move-object/from16 v2, v28

    invoke-direct {v0, v4, v1, v8, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetDeviceStatusDimmer;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .restart local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    goto :goto_6

    .line 3635
    .end local v19    # "binaryState":Ljava/lang/String;
    .end local v20    # "brightness":Ljava/lang/String;
    .end local v22    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    .end local v28    # "fader":Ljava/lang/String;
    :cond_1c
    const-string v4, "NestThermostat"

    move-object/from16 v0, p3

    invoke-virtual {v0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1d

    .line 3637
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3638
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    move-object/from16 v0, p0

    iget-object v4, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v31

    .line 3639
    .local v31, "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNestAttribute;

    sget-object v9, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual/range {v31 .. v31}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v11

    invoke-virtual/range {v31 .. v31}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v12

    invoke-virtual/range {v31 .. v31}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getStatusTS()I

    move-result v4

    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v10, p1

    move-object/from16 v14, p2

    invoke-direct/range {v8 .. v14}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNestAttribute;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto/16 :goto_0

    .line 3641
    .end local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v31    # "mDeviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1d
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_1e

    .line 3642
    const-string v4, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "calling SetDeviceStateRunnable: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    move-object/from16 v0, p2

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v4, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3643
    new-instance v25, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    const/4 v9, 0x0

    const-string v10, "binaryState"

    move-object/from16 v0, p2

    invoke-virtual {v0, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    aput-object v10, v8, v9

    const/4 v9, 0x1

    aput-object p1, v8, v9

    move-object/from16 v0, v25

    invoke-direct {v0, v4, v8}, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;-><init>(Landroid/content/Context;[Ljava/lang/Object;)V

    .line 3644
    .restart local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v4

    move-object/from16 v0, v25

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    goto/16 :goto_0

    .line 3646
    .end local v25    # "deviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceStateRunnable;
    :cond_1e
    new-instance v21, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, v21

    invoke-direct {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3647
    .restart local v21    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;

    sget-object v8, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-direct {v4, v8, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChange;-><init>(Landroid/content/Context;Ljava/lang/String;Lorg/json/JSONObject;)V

    move-object/from16 v0, v21

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public setFirstRemoteCall(Z)V
    .locals 0
    .param p1, "value"    # Z

    .prologue
    .line 838
    sput-boolean p1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->firstRemoteCall:Z

    .line 839
    return-void
.end method

.method public setGroupState(Ljava/lang/String;Lorg/json/JSONObject;Ljava/lang/String;)V
    .locals 18
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "attribute"    # Lorg/json/JSONObject;
    .param p3, "bridgeUDN"    # Ljava/lang/String;

    .prologue
    .line 3668
    const-string v3, ""

    .line 3669
    .local v3, "capabilityID":Ljava/lang/String;
    const-string v4, ""

    .line 3670
    .local v4, "capabilityName":Ljava/lang/String;
    const-string v5, ""

    .line 3671
    .local v5, "value":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lorg/json/JSONObject;->names()Lorg/json/JSONArray;

    move-result-object v17

    .line 3674
    .local v17, "names":Lorg/json/JSONArray;
    const/4 v15, 0x0

    .local v15, "i":I
    :goto_0
    :try_start_0
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v15, v2, :cond_2

    .line 3675
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v16

    .local v16, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_1
    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface/range {v16 .. v16}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map$Entry;

    .line 3676
    .local v13, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    move-object/from16 v0, v17

    invoke-virtual {v0, v15}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 3677
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v13}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 3678
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 3679
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-interface {v13}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    move-object/from16 v0, p2

    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v6, ","

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_1

    .line 3674
    .end local v13    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    add-int/lit8 v15, v15, 0x1

    goto/16 :goto_0

    .line 3683
    .end local v16    # "i$":Ljava/util/Iterator;
    :cond_2
    const-string v2, ","

    invoke-virtual {v3, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 3684
    const/4 v2, 0x0

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v3, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 3686
    :cond_3
    const-string v2, ","

    invoke-virtual {v4, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 3687
    const/4 v2, 0x0

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v4, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 3689
    :cond_4
    const-string v2, ","

    invoke-virtual {v5, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 3690
    const/4 v2, 0x0

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v5, v2, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v5

    .line 3692
    :cond_5
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 3693
    const-string v2, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "calling SetZigbeeDeviceStateRunnable: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p2

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3694
    new-instance v1, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    const-string v8, "YES"

    move-object/from16 v6, p3

    move-object/from16 v7, p1

    invoke-direct/range {v1 .. v8}, Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3696
    .local v1, "zigbeeDeviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v2

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 3706
    .end local v1    # "zigbeeDeviceStateSetter":Lcom/belkin/wemo/cache/devicelist/runnable/SetZigbeeDeviceStateRunnable;
    :goto_2
    return-void

    .line 3698
    :cond_6
    const-string v2, "DeviceListManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "calling CloudRequestZigbeeStateChange: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    move-object/from16 v0, p2

    invoke-virtual {v6, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v2, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3699
    new-instance v12, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v12, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 3700
    .local v12, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeGroupStateChange;

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object/from16 v8, p1

    move-object v9, v3

    move-object v10, v4

    move-object v11, v5

    invoke-direct/range {v6 .. v11}, Lcom/belkin/wemo/cache/cloud/CloudRequestZigbeeGroupStateChange;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v12, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 3702
    .end local v12    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :catch_0
    move-exception v14

    .line 3703
    .local v14, "ex":Lorg/json/JSONException;
    invoke-virtual {v14}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2
.end method

.method public setHTMLForDevice(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "devUdn"    # Ljava/lang/String;
    .param p2, "devHTML"    # Ljava/lang/String;

    .prologue
    .line 4698
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->setDeviceHTML(Ljava/lang/String;Ljava/lang/String;)V

    .line 4699
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1, p2}, Lcom/belkin/wemo/cache/CacheManager;->setDeviceHTML(Ljava/lang/String;Ljava/lang/String;)V

    .line 4700
    return-void
.end method

.method public setInsightDrawerState(ILjava/lang/String;)V
    .locals 2
    .param p1, "isOpened"    # I
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    .line 4787
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 4788
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v0, p2, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setInsightDrawerState(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4792
    :goto_0
    return-void

    .line 4790
    :cond_0
    const-string v0, "DeviceListManager"

    const-string v1, "setInsightDrawerState: UDN is NULL"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setLedFriendlyName(Lorg/json/JSONArray;)Lorg/json/JSONArray;
    .locals 12
    .param p1, "fnData"    # Lorg/json/JSONArray;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    const/4 v10, 0x1

    const/4 v9, 0x0

    .line 5978
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 5980
    .local v6, "jsonStatus":Lorg/json/JSONArray;
    invoke-virtual {p1, v9}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    .line 5981
    .local v3, "devId":Ljava/lang/String;
    invoke-virtual {p1, v10}, Lorg/json/JSONArray;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v5

    .line 5982
    .local v5, "friendlyName":Ljava/lang/String;
    const-string v7, ""

    .line 5984
    .local v7, "mBridgeUdn":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getUpnpControl()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v1

    .line 5985
    .local v1, "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    if-eqz v1, :cond_0

    .line 5986
    invoke-virtual {p0, v3, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getBridgeUdn(Ljava/lang/String;Lorg/cybergarage/upnp/ControlPoint;)Ljava/lang/String;

    move-result-object v7

    .line 5987
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "bridge udn if:---"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v11

    invoke-virtual {v11}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, "--"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5990
    :cond_0
    if-eqz v7, :cond_1

    .line 5991
    invoke-virtual {v1, v7}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v9

    const-string v10, "SetDeviceName"

    invoke-virtual {v9, v10}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v0

    .line 5992
    .local v0, "action":Lorg/cybergarage/upnp/Action;
    sget-object v9, Lcom/belkin/wemo/cache/devicelist/UpnpConstants;->ARGS_LED_FRIENDLY_NAME:[Ljava/lang/String;

    const/4 v10, 0x2

    new-array v10, v10, [Ljava/lang/String;

    const/4 v11, 0x0

    aput-object v3, v10, v11

    const/4 v11, 0x1

    aput-object v5, v10, v11

    invoke-virtual {p0, v0, v9, v10}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    .line 5993
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Action;->postControlAction()Ljava/lang/String;

    move-result-object v8

    .line 5994
    .local v8, "response":Ljava/lang/String;
    const-string v9, "DeviceListManager"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "set friendly name: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5995
    if-eqz v8, :cond_1

    .line 5996
    new-instance v2, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;-><init>()V

    .line 5997
    .local v2, "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    invoke-virtual {v2, v8}, Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;->parseCreateGroupResponse(Ljava/lang/String;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v6

    .line 6006
    .end local v0    # "action":Lorg/cybergarage/upnp/Action;
    .end local v1    # "controlPoint":Lorg/cybergarage/upnp/ControlPoint;
    .end local v2    # "createGroupResponse":Lcom/belkin/wemo/cache/utils/GetCreateGroupResponseParser;
    .end local v8    # "response":Ljava/lang/String;
    :cond_1
    :goto_0
    return-object v6

    .line 6002
    :catch_0
    move-exception v4

    .line 6003
    .local v4, "e":Ljava/lang/Exception;
    const-string v9, "DeviceListManager"

    const-string v10, "Exception in setLedFriendlyName(): "

    invoke-static {v9, v10, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public setNewStateForDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "devUDN"    # Ljava/lang/String;
    .param p2, "friendlyName"    # Ljava/lang/String;
    .param p3, "state"    # Ljava/lang/String;

    .prologue
    .line 2974
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 2975
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting new state for device. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; FriendlyName: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2976
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromMemoryByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 2977
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 2978
    invoke-static {p3}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 2979
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 2980
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 2989
    :cond_0
    const-string v1, "state_changed"

    const-string v2, ""

    invoke-virtual {p0, v1, v2, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2994
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :goto_0
    return-void

    .line 2991
    :cond_1
    const-string v1, "DeviceListManager"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Setting new state for device failed as STATE or Friendly Name or both are empty. UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2992
    const-string v1, "change_state_in_remote_failed"

    const-string v2, ""

    invoke-virtual {p0, v1, v2, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setNewStateForMakerDevice(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 6
    .param p1, "devUDN"    # Ljava/lang/String;
    .param p2, "friendlyName"    # Ljava/lang/String;
    .param p3, "state"    # Ljava/lang/String;
    .param p4, "attributeList"    # Ljava/lang/String;

    .prologue
    .line 2998
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 2999
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Setting new state for MAKER. UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; FriendlyName: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; state: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; attribute list: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3000
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceInformationFromMemoryByUDN(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 3001
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v2, 0x0

    .line 3002
    .local v2, "updateAttributeList":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 3003
    invoke-direct {p0, p4, v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateAttributeForMaker(Ljava/lang/String;Lcom/belkin/wemo/cache/data/DeviceInformation;)Ljava/lang/String;

    move-result-object v2

    .line 3007
    if-eqz v2, :cond_0

    :try_start_0
    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 3009
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 3012
    :cond_0
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 3013
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v3, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 3031
    :cond_1
    :goto_0
    const-string v3, "state_changed"

    const-string v4, ""

    invoke-virtual {p0, v3, v4, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 3036
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v2    # "updateAttributeList":Ljava/lang/String;
    :goto_1
    return-void

    .line 3014
    .restart local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v2    # "updateAttributeList":Ljava/lang/String;
    :catch_0
    move-exception v1

    .line 3015
    .local v1, "e":Lorg/json/JSONException;
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "JSONException while setting attribute list for MAKER. UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 3033
    .end local v0    # "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "e":Lorg/json/JSONException;
    .end local v2    # "updateAttributeList":Ljava/lang/String;
    :cond_2
    const-string v3, "DeviceListManager"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Setting new state for MAKER failed as STATE or Friendly Name or both are empty. UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3034
    const-string v3, "change_state_in_remote_failed"

    const-string v4, ""

    invoke-virtual {p0, v3, v4, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setNightModeConfiguration(Ljava/lang/String;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V
    .locals 18
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "nightMode"    # I
    .param p3, "startTime"    # I
    .param p4, "endTime"    # I
    .param p5, "nightModeBrightness"    # I
    .param p6, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;
    .param p7, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;

    .prologue
    .line 1728
    invoke-virtual/range {p0 .. p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDevice(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    .line 1729
    .local v5, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v5, :cond_3

    .line 1730
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 1732
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v14

    .line 1733
    .local v14, "dev":Lorg/cybergarage/upnp/Device;
    if-eqz v14, :cond_1

    .line 1734
    const-string v4, "ConfigureNightMode"

    invoke-virtual {v14, v4}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v12

    .line 1735
    .local v12, "action":Lorg/cybergarage/upnp/Action;
    if-eqz v12, :cond_0

    .line 1736
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "<nightMode>"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p2

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "</"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "nightMode"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "<"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "endTime"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "</"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "endTime"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "<"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "startTime"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p3

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "</"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "startTime"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "<"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "nightModeBrightness"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    move/from16 v0, p5

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "</"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, "nightModeBrightness"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v6, ">"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    .line 1741
    .local v13, "attributesXML":Ljava/lang/String;
    const-string v4, "NightModeConfiguration"

    invoke-virtual {v12, v4, v13}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1742
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v16

    new-instance v17, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;

    move-object/from16 v0, v17

    move-object/from16 v1, p0

    move-object/from16 v2, p7

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$14;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V

    new-instance v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;

    move-object/from16 v4, p0

    move/from16 v6, p2

    move/from16 v7, p3

    move/from16 v8, p4

    move/from16 v9, p5

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v3 .. v11}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$15;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V

    move-object/from16 v0, v16

    move-object/from16 v1, v17

    invoke-virtual {v0, v12, v1, v3}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 1803
    .end local v12    # "action":Lorg/cybergarage/upnp/Action;
    .end local v13    # "attributesXML":Ljava/lang/String;
    .end local v14    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 1785
    .restart local v14    # "dev":Lorg/cybergarage/upnp/Device;
    :cond_1
    const-string v15, "setNightModeConfiguration: Control Point object is NULL"

    .line 1786
    .local v15, "error":Ljava/lang/String;
    const-string v4, "DeviceListManager"

    invoke-static {v4, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1787
    if-eqz p7, :cond_0

    .line 1788
    move-object/from16 v0, p7

    invoke-interface {v0, v15}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0

    .line 1793
    .end local v14    # "dev":Lorg/cybergarage/upnp/Device;
    .end local v15    # "error":Ljava/lang/String;
    :cond_2
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;

    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move/from16 v6, p2

    move/from16 v7, p5

    move/from16 v8, p3

    move/from16 v9, p4

    move-object/from16 v10, p6

    move-object/from16 v11, p7

    invoke-direct/range {v3 .. v11}, Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/data/DeviceInformation;IIIILcom/belkin/wemo/cache/devicelist/callback/SetNightModeSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;)V

    .line 1794
    .local v3, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v6, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v4, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 1797
    .end local v3    # "request":Lcom/belkin/wemo/cache/cloud/CloudRequestSetNightModeConfiguration;
    :cond_3
    const-string v15, "setNightModeConfiguration: DeviceInformation object is NULL"

    .line 1798
    .restart local v15    # "error":Ljava/lang/String;
    const-string v4, "DeviceListManager"

    invoke-static {v4, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1799
    if-eqz p7, :cond_0

    .line 1800
    move-object/from16 v0, p7

    invoke-interface {v0, v15}, Lcom/belkin/wemo/cache/devicelist/callback/SetNightModeErrorCallback;->onNightModeConfigurationFailed(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setRemoteAccess()Lorg/json/JSONArray;
    .locals 2

    .prologue
    .line 4605
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4606
    .local v0, "array":Lorg/json/JSONArray;
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->enableRemoteAccess()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Z)Lorg/json/JSONArray;

    .line 4607
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 4608
    return-object v0
.end method

.method public setUnicastFailedForAnyDevice(Z)V
    .locals 1
    .param p1, "unicastFailed"    # Z

    .prologue
    .line 7401
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->setUnicastFailedForAnyDevice(Z)V

    .line 7402
    return-void
.end method

.method public startCloudPeriodicUpdate()V
    .locals 6

    .prologue
    const-wide/32 v2, 0xea60

    .line 755
    const-string v0, "DeviceListManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "STARTING CLOUD PERIODIC UPDATE. isLocal: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 756
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-nez v0, :cond_1

    .line 757
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    if-nez v0, :cond_0

    .line 758
    new-instance v0, Ljava/util/Timer;

    invoke-direct {v0}, Ljava/util/Timer;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    .line 761
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$3;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    move-wide v4, v2

    invoke-virtual/range {v0 .. v5}, Ljava/util/Timer;->scheduleAtFixedRate(Ljava/util/TimerTask;JJ)V

    .line 771
    :cond_1
    return-void
.end method

.method public startUnicastDiscovery()V
    .locals 3

    .prologue
    .line 1012
    invoke-static {}, Lcom/belkin/wemo/cache/utils/Locks;->getInstance()Lcom/belkin/wemo/cache/utils/Locks;

    move-result-object v1

    sget-object v2, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_UNICAST_DISOCVERY:Ljava/lang/Integer;

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/cache/utils/Locks;->isLocked(Ljava/lang/Integer;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1013
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->clearDeviceDiscoveries()V

    .line 1014
    new-instance v0, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getSmartDiscovery()Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V

    .line 1015
    .local v0, "unicastDiscoveryRunnable":Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 1017
    .end local v0    # "unicastDiscoveryRunnable":Lcom/belkin/wemo/cache/devicelist/runnable/UnicastDiscoveryRunnable;
    :cond_0
    return-void
.end method

.method public stateChangeRequestForMaker(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "pluginID"    # Ljava/lang/String;
    .param p3, "mac"    # Ljava/lang/String;
    .param p4, "newState"    # Ljava/lang/String;
    .param p5, "newAttributeList"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x0

    .line 2958
    const-string v0, "setNewStateForMaker: "

    const-string v1, "stateChangeRequestForMaker"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 2959
    const-string v0, ""

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, ""

    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 2960
    :cond_0
    const/4 v0, 0x1

    invoke-virtual {p0, p1, v2, v0, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v9

    .line 2962
    .local v9, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v9, :cond_1

    .line 2963
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object p2

    .line 2964
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object p3

    .line 2967
    .end local v9    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    :cond_1
    new-instance v8, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v8, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 2968
    .local v8, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;

    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    move-object v1, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v0 .. v7}, Lcom/belkin/wemo/cache/cloud/CloudRequestStateChangeForMaker;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v8, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 2970
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 1117
    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveDeviceCache()V

    .line 1119
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopListen()V

    .line 1121
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$6;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 1131
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    if-eqz v0, :cond_0

    .line 1132
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->stopListening(Landroid/content/Context;)V

    .line 1133
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->networkStateListener:Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    .line 1135
    :cond_0
    return-void
.end method

.method public stopCloudPeriodicUpdate()V
    .locals 2

    .prologue
    .line 774
    const-string v0, "DeviceListManager"

    const-string v1, "STOPPING CLOUD PERIODIC UPDATE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 775
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    if-eqz v0, :cond_0

    .line 776
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    invoke-virtual {v0}, Ljava/util/Timer;->cancel()V

    .line 777
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateTimer:Ljava/util/Timer;

    .line 779
    :cond_0
    return-void
.end method

.method public stopListen()V
    .locals 2

    .prologue
    .line 3231
    const-string v0, "Listeners"

    const-string v1, "in StopListen"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3232
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v0, :cond_0

    .line 3233
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->removeDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V

    .line 3234
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->removeEventListener(Lorg/cybergarage/upnp/event/EventListener;)V

    .line 3236
    :cond_0
    return-void
.end method

.method public stopUnicastDiscovery()V
    .locals 1

    .prologue
    .line 1193
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    if-eqz v0, :cond_0

    .line 1194
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->worker:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdown()V

    .line 1195
    :cond_0
    return-void
.end method

.method public subscribeToService(Lorg/cybergarage/upnp/Device;)Z
    .locals 9
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 3758
    const/4 v2, 0x0

    .line 3760
    .local v2, "result":Z
    if-eqz p1, :cond_3

    .line 3761
    :try_start_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v4

    .line 3762
    .local v4, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    if-eqz v4, :cond_3

    .line 3763
    const/4 v1, 0x0

    .local v1, "j":I
    :goto_0
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v6

    if-ge v1, v6, :cond_2

    .line 3764
    invoke-virtual {v4, v1}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v3

    .line 3765
    .local v3, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/Service;->getServiceType()Ljava/lang/String;

    move-result-object v5

    .line 3766
    .local v5, "type":Ljava/lang/String;
    const-string v6, "DeviceListManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "subscribeToService: UDN: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; Service Type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3767
    const-string v6, "urn:Belkin:service:basicevent:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "urn:Belkin:service:firmwareupdate:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "urn:Belkin:service:timesync:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "urn:Belkin:service:bridge:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_0

    const-string v6, "urn:Belkin:service:deviceevent:1"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isSmart(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 3773
    :cond_0
    const-string v6, "sdk DeviceListManager: inside"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "sdk DeviceListManager: inside"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3775
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v6, :cond_1

    .line 3776
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 3778
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v6, v3}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v6

    if-nez v6, :cond_1

    .line 3779
    const/4 v6, 0x0

    .line 3791
    .end local v1    # "j":I
    .end local v3    # "service":Lorg/cybergarage/upnp/Service;
    .end local v4    # "serviceList":Lorg/cybergarage/upnp/ServiceList;
    .end local v5    # "type":Ljava/lang/String;
    :goto_1
    return v6

    .line 3763
    .restart local v1    # "j":I
    .restart local v3    # "service":Lorg/cybergarage/upnp/Service;
    .restart local v4    # "serviceList":Lorg/cybergarage/upnp/ServiceList;
    .restart local v5    # "type":Ljava/lang/String;
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto/16 :goto_0

    .line 3785
    .end local v3    # "service":Lorg/cybergarage/upnp/Service;
    .end local v5    # "type":Ljava/lang/String;
    :cond_2
    const/4 v2, 0x1

    .end local v1    # "j":I
    .end local v4    # "serviceList":Lorg/cybergarage/upnp/ServiceList;
    :cond_3
    move v6, v2

    .line 3788
    goto :goto_1

    .line 3789
    :catch_0
    move-exception v0

    .line 3790
    .local v0, "ex":Ljava/lang/Exception;
    const-string v6, "DeviceListManager"

    const-string v7, "Exception in subscribeToService ex:"

    invoke-static {v6, v7, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    move v6, v2

    .line 3791
    goto :goto_1
.end method

.method public updateAtributeListForInsightInRemote(Lorg/json/JSONObject;Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 3
    .param p1, "attributes"    # Lorg/json/JSONObject;
    .param p2, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v2, 0x1

    .line 3661
    invoke-virtual {p2, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setAttributeList(Lorg/json/JSONObject;)V

    .line 3662
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 3663
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v1, 0x0

    invoke-virtual {v0, p2, v1, v2, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 3665
    return-void
.end method

.method public updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;)V
    .locals 3
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;

    .prologue
    const/4 v2, 0x1

    .line 7359
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 7360
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/CacheManager;->isDeviceInDB(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 7361
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1, v2, v2, v2}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 7365
    :goto_0
    return-void

    .line 7363
    :cond_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0, p1, v2, v2, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    goto :goto_0
.end method

.method public updateDeviceCacheInDeviceList(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "oDev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "needUpdateIcon"    # Ljava/lang/Boolean;

    .prologue
    .line 6128
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    invoke-virtual {v0, p1, v1}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 6129
    return-void
.end method

.method public updateDeviceDiscovery(Ljava/lang/String;)V
    .locals 4
    .param p1, "deviceId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 7038
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 7039
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 7040
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 7041
    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 7042
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, v0, v2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 7043
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, v0, v2, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 7044
    const-string v1, "update"

    const-string v2, ""

    invoke-virtual {p0, v1, v2, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 7046
    :cond_0
    return-void
.end method

.method public updateDeviceNameInListAndCache(Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "friendlyName"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 2568
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V

    .line 2571
    invoke-virtual {p0, p1, v2, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getDeviceFromDBByUDN(Ljava/lang/String;ZZZ)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 2573
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 2574
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setFriendlyName(Ljava/lang/String;)V

    .line 2575
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v1, v0, v2, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDeviceFromDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 2577
    :cond_0
    const-string v1, "update"

    const-string v2, ""

    invoke-virtual {p0, v1, v2, p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 2579
    return-void
.end method

.method public updateDeviceParameters(Ljava/util/ArrayList;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 7262
    .local p1, "devList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    const-string v4, "DeviceListManager"

    const-string v5, " in UpdateDeviceParameters"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7263
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_5

    .line 7264
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .local v3, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 7265
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getBridgeUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_0

    .line 7267
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 7268
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-nez v1, :cond_3

    .line 7269
    const-string v4, "DeviceListManager"

    const-string v5, " device is null"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7270
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-nez v4, :cond_1

    .line 7271
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-static {v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    move-result-object v4

    sput-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 7273
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-nez v4, :cond_2

    .line 7275
    new-instance v4, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v4}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 7278
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lorg/cybergarage/upnp/ControlPoint;->getDevice(Ljava/lang/String;)Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 7281
    :cond_3
    if-nez v1, :cond_4

    .line 7282
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " device not reachable"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7283
    const/4 v4, 0x0

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIsDiscovered(Z)V

    .line 7284
    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setInActive(I)V

    .line 7285
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 7286
    const-string v4, "update"

    const-string v5, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 7288
    :cond_4
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, " found device"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7289
    move-object v2, v1

    .line 7290
    .local v2, "deviceObj":Lorg/cybergarage/upnp/Device;
    new-instance v4, Ljava/lang/Thread;

    new-instance v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;

    invoke-direct {v5, p0, v0, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager$27;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;Lorg/cybergarage/upnp/Device;)V

    invoke-direct {v4, v5}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v4}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0

    .line 7307
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v1    # "device":Lorg/cybergarage/upnp/Device;
    .end local v2    # "deviceObj":Lorg/cybergarage/upnp/Device;
    .end local v3    # "i$":Ljava/util/Iterator;
    :cond_5
    return-void
.end method

.method public updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 4703
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1, p2}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateFriendlyName(Ljava/lang/String;Ljava/lang/String;)V

    .line 4704
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 4705
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 4706
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v4, v4, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 4708
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 4710
    new-instance v1, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 4711
    .local v1, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v2, "cache.db"

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 4713
    .end local v1    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_1
    return-void
.end method

.method public updateGroupLedIconFile(Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 8
    .param p1, "iconLocation"    # Ljava/lang/String;
    .param p2, "uploadID"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p3, "udnList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v7, 0x0

    .line 5072
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 5073
    .local v3, "udn":Ljava/lang/String;
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, v3}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 5074
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 5075
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconUploadId(Ljava/lang/String;)V

    .line 5076
    invoke-virtual {v0, p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setGroupIcon(Ljava/lang/String;)V

    .line 5077
    invoke-virtual {v0, p2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 5078
    sget-object v4, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v5, 0x1

    invoke-virtual {v4, v0, v7, v7, v5}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 5079
    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v4, v0, v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 5080
    const-string v4, "update"

    const-string v5, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {p0, v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5081
    const-string v4, "DeviceListManager"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "LED ICONINFO: updateGroupLedIconFile dev UDN: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; iconversion: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; groupIcon: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 5084
    .end local v0    # "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "udn":Ljava/lang/String;
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 5086
    new-instance v2, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v2}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 5087
    .local v2, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v4, "cache.db"

    sget-object v5, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v2, v4, v5}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 5089
    .end local v2    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_2
    return-void
.end method

.method public updateIconFile(Ljava/lang/String;Landroid/graphics/Bitmap;)V
    .locals 3
    .param p1, "devUDN"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;

    .prologue
    .line 5024
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 5025
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_0

    .line 5026
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v0, p2, v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->saveIconToFile(Landroid/graphics/Bitmap;Landroid/content/Context;)V

    .line 5027
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, p1, v2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;->onIconUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 5028
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/belkin/wemo/cache/CacheManager;->setDeviceIcon(Ljava/lang/String;Ljava/lang/String;)V

    .line 5030
    :cond_0
    return-void
.end method

.method public updateLedIconFile(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 5
    .param p1, "ledUniqueID"    # Ljava/lang/String;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "uploadID"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 5052
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 5053
    .local v0, "dev":Lcom/belkin/wemo/cache/data/DeviceInformation;
    if-eqz v0, :cond_1

    .line 5054
    invoke-static {p2, p1, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveRemoteIconToStorage(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 5055
    invoke-virtual {v0, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconUploadId(Ljava/lang/String;)V

    .line 5056
    invoke-virtual {v0, p3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 5057
    sget-object v2, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v3, 0x1

    invoke-virtual {v2, v0, v4, v4, v3}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 5058
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v2, v0, v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->updateDeviceCache(Lcom/belkin/wemo/cache/data/DeviceInformation;Z)V

    .line 5059
    const-string v2, "update"

    const-string v3, ""

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v2, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 5060
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 5062
    new-instance v1, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v1}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 5063
    .local v1, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v2, "cache.db"

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 5065
    .end local v1    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_0
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "LED ICONINFO: updateLedIconFile dev: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; iconversion: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 5069
    :cond_1
    return-void
.end method

.method public updateLocalMode()V
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 805
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    if-nez v0, :cond_0

    .line 806
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 809
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->remoteAccessManager:Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/remoteaccess/RemoteAccessManager;->isRemoteEnabled()Z

    move-result v0

    if-nez v0, :cond_2

    invoke-direct {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isLocalMode()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 811
    :cond_1
    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 819
    :goto_0
    return-void

    .line 813
    :cond_2
    const-string v0, "Home"

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 814
    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    goto :goto_0

    .line 816
    :cond_3
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    goto :goto_0
.end method

.method public updateRemoteIconFile(Lcom/belkin/wemo/cache/data/DeviceInformation;Landroid/graphics/Bitmap;Ljava/lang/String;)V
    .locals 5
    .param p1, "dev"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "bitmap"    # Landroid/graphics/Bitmap;
    .param p3, "version"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 5033
    if-eqz p1, :cond_0

    .line 5034
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1, p3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->saveRemoteIconToStorage(Landroid/graphics/Bitmap;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 5035
    .local v0, "icon":Ljava/lang/String;
    invoke-virtual {p1, v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 5036
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v1, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 5037
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lcom/belkin/wemo/cache/CacheManager;->setDeviceIcon(Ljava/lang/String;Ljava/lang/String;)V

    .line 5038
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v2, 0x1

    invoke-virtual {v1, p1, v4, v4, v2}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 5039
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    if-eqz v1, :cond_0

    .line 5040
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mActivity:Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIcon()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/DeviceListManagerCallbacksActivity;->onIconUpdate(Ljava/lang/String;Ljava/lang/String;)V

    .line 5043
    .end local v0    # "icon":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public updateZigbeeCapabilities(Ljava/lang/String;Lorg/json/JSONObject;)Lcom/belkin/wemo/cache/data/DeviceInformation;
    .locals 10
    .param p1, "deviceId"    # Ljava/lang/String;
    .param p2, "updatedCapabilities"    # Lorg/json/JSONObject;

    .prologue
    .line 7106
    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v7, p1}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v5

    .line 7108
    .local v5, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "device info :"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7109
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v0

    .line 7111
    .local v0, "capabilitiesList":Ljava/lang/String;
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_4

    .line 7114
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7115
    .local v1, "deviceCapabilities":Lorg/json/JSONObject;
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "capabilities JSONObject:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7117
    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-eqz v7, :cond_0

    sget-object v7, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 7118
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 7120
    :cond_1
    invoke-virtual {p2}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v4

    .line 7121
    .local v4, "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_2
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 7122
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 7123
    .local v3, "key":Ljava/lang/String;
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 7124
    .local v6, "value":Ljava/lang/String;
    if-eqz v6, :cond_2

    .line 7125
    invoke-virtual {v1, v3, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7126
    const-string v7, "DeviceListManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "updating capability:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " value:"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 7132
    .end local v1    # "deviceCapabilities":Lorg/json/JSONObject;
    .end local v3    # "key":Ljava/lang/String;
    .end local v4    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v6    # "value":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 7133
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 7138
    .end local v2    # "e":Lorg/json/JSONException;
    :goto_1
    return-object v5

    .line 7129
    .restart local v1    # "deviceCapabilities":Lorg/json/JSONObject;
    .restart local v4    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_3
    :try_start_1
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v7}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    .line 7136
    .end local v1    # "deviceCapabilities":Lorg/json/JSONObject;
    .end local v4    # "keysIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_4
    const-string v7, "DeviceListManager"

    const-string v8, "capabilities or state is empty:"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public updateZigbeeCapability(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 17
    .param p1, "deviceId"    # Ljava/lang/String;
    .param p2, "capabilityIdToSet"    # Ljava/lang/String;
    .param p3, "capabilityValueToSet"    # Ljava/lang/String;

    .prologue
    .line 7049
    const-string v9, "10008"

    .line 7050
    .local v9, "levelControl":Ljava/lang/String;
    const-string v11, "10006"

    .line 7051
    .local v11, "onOff":Ljava/lang/String;
    const-string v12, "1"

    .line 7052
    .local v12, "onOff_value":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    move-object/from16 v0, p1

    invoke-virtual {v13, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v8

    .line 7054
    .local v8, "ledDevice":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const-string v13, "DeviceListManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "device info :"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7055
    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getCapabilities()Ljava/lang/String;

    move-result-object v3

    .line 7057
    .local v3, "capabilitiesList":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v13

    if-nez v13, :cond_7

    .line 7060
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, v3}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 7061
    .local v1, "capabilities":Lorg/json/JSONObject;
    const-string v13, "DeviceListManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "capabilities JSONObject:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7062
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    if-eqz v13, :cond_0

    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v13}, Ljava/util/LinkedHashMap;->isEmpty()Z

    move-result v13

    if-eqz v13, :cond_1

    .line 7063
    :cond_0
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->updateCapabilityProfileTable()V

    .line 7065
    :cond_1
    const-string v13, ","

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 7066
    .local v4, "capabilityIDArray":[Ljava/lang/String;
    const-string v13, ","

    move-object/from16 v0, p3

    invoke-virtual {v0, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 7068
    .local v5, "capabilityValueArray":[Ljava/lang/String;
    array-length v2, v4

    .line 7069
    .local v2, "capabilitiesCount":I
    const/4 v7, 0x0

    .local v7, "i":I
    :goto_0
    if-ge v7, v2, :cond_4

    .line 7070
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    aget-object v14, v4, v7

    invoke-virtual {v13, v14}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    aget-object v14, v5, v7

    invoke-virtual {v1, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7071
    aget-object v13, v4, v7

    invoke-virtual {v13, v9}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 7072
    const-string v13, "DeviceListManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "updating onOFF"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7073
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->capabalityProfileList:Ljava/util/LinkedHashMap;

    invoke-virtual {v13, v11}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    invoke-virtual {v1, v13, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 7077
    :cond_2
    aget-object v13, v4, v7

    invoke-virtual {v13, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 7078
    aget-object v13, v5, v7

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    invoke-virtual {v8, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setState(I)V

    .line 7080
    :cond_3
    const-string v13, "DeviceListManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "updating capability: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    aget-object v15, v4, v7

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    const-string v15, " value: "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    aget-object v15, v5, v7

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7069
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 7083
    :cond_4
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v8, v13}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setCapabilities(Ljava/lang/String;)V

    .line 7084
    const-string v13, "DeviceListManager"

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Updated capabilities:"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 7085
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->devicesArray:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-virtual {v13, v8}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 7086
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    invoke-virtual {v8}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/cache/CacheManager;->isDeviceInDB(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_6

    .line 7087
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v8, v14, v15, v0}, Lcom/belkin/wemo/cache/CacheManager;->addDeviceToDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)Z

    .line 7092
    :goto_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v13

    if-eqz v13, :cond_5

    .line 7094
    new-instance v10, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v10}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 7095
    .local v10, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v13, "cache.db"

    sget-object v14, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-virtual {v10, v13, v14}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 7103
    .end local v1    # "capabilities":Lorg/json/JSONObject;
    .end local v2    # "capabilitiesCount":I
    .end local v4    # "capabilityIDArray":[Ljava/lang/String;
    .end local v5    # "capabilityValueArray":[Ljava/lang/String;
    .end local v7    # "i":I
    .end local v10    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    :cond_5
    :goto_2
    return-void

    .line 7089
    .restart local v1    # "capabilities":Lorg/json/JSONObject;
    .restart local v2    # "capabilitiesCount":I
    .restart local v4    # "capabilityIDArray":[Ljava/lang/String;
    .restart local v5    # "capabilityValueArray":[Ljava/lang/String;
    .restart local v7    # "i":I
    :cond_6
    sget-object v13, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->cacheManager:Lcom/belkin/wemo/cache/CacheManager;

    const/4 v14, 0x1

    const/4 v15, 0x0

    const/16 v16, 0x1

    move/from16 v0, v16

    invoke-virtual {v13, v8, v14, v15, v0}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 7097
    .end local v1    # "capabilities":Lorg/json/JSONObject;
    .end local v2    # "capabilitiesCount":I
    .end local v4    # "capabilityIDArray":[Ljava/lang/String;
    .end local v5    # "capabilityValueArray":[Ljava/lang/String;
    .end local v7    # "i":I
    :catch_0
    move-exception v6

    .line 7098
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_2

    .line 7101
    .end local v6    # "e":Lorg/json/JSONException;
    :cond_7
    const-string v13, "DeviceListManager"

    const-string v14, "capabilities empty:"

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2
.end method

.method public updateZigbeeStateResponse()V
    .locals 2

    .prologue
    .line 3709
    const-string v0, "DeviceListManager"

    const-string v1, "in updateZigbeeStateResponse"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 3711
    return-void
.end method

.method public verifyHomeNetwork()V
    .locals 5

    .prologue
    .line 650
    const-string v2, "DeviceListManager"

    const-string v3, "in verifyHomeNetwork"

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 651
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    if-nez v2, :cond_0

    .line 652
    new-instance v2, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 655
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    if-nez v2, :cond_1

    .line 656
    new-instance v2, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    sget-object v3, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->context:Landroid/content/Context;

    invoke-direct {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 659
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getArpMac()Ljava/lang/String;

    move-result-object v1

    .line 660
    .local v1, "currentArpMac":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getCacheArpMac()Ljava/lang/String;

    move-result-object v0

    .line 662
    .local v0, "cachedArpMac":Ljava/lang/String;
    const-string v2, "DeviceListManager"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Current ARPMAC: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; cached ArpMac: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 664
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v2, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setCacheArpMac(Ljava/lang/String;)Z

    .line 666
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 667
    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isRemoteEnabled()Z

    move-result v2

    if-nez v2, :cond_2

    .line 669
    invoke-virtual {p0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->resetHomeNetwork()V

    .line 670
    const-string v2, "reset_cache"

    const-string v3, ""

    const-string v4, ""

    invoke-virtual {p0, v2, v3, v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 673
    :cond_2
    return-void
.end method
