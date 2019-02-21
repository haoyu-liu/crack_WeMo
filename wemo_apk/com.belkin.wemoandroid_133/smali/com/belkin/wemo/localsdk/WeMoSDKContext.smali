.class public Lcom/belkin/wemo/localsdk/WeMoSDKContext;
.super Ljava/lang/Object;
.source "WeMoSDKContext.java"

# interfaces
.implements Lorg/cybergarage/upnp/device/DeviceChangeListener;
.implements Lorg/cybergarage/upnp/event/EventListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;,
        Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;,
        Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;,
        Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceGetter;,
        Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;
    }
.end annotation


# static fields
.field public static final ADD_DEVICE:Ljava/lang/String; = "add"

.field public static final BULB_FW_UPDATE:Ljava/lang/String; = "SubDeviceFWUpdate"

.field public static final CHANGE_ATTRIBUTE:Ljava/lang/String; = "change_attribute"

.field public static final CHANGE_STATE:Ljava/lang/String; = "change_state"

.field public static final COUNTDOWN_TIME:Ljava/lang/String; = "CountdownEndTime"

.field public static final MSEARCH_CONCURRENT_ATTEMPT:I = 0x2

.field public static final MSEARCH_CONCURRENT_INTERVAL:I = 0xc8

.field public static final MSEARCH_FINAL_INTERVAL:I = 0x1f4

.field public static final MSEARCH_INTERVAL:I = 0x258

.field public static final MSEARCH_ITERATION:I = 0x3

.field public static final REFRESH_LIST:Ljava/lang/String; = "refresh"

.field public static final REMOVE_DEVICE:Ljava/lang/String; = "remove"

.field public static final SET_ATTRIBUTE:Ljava/lang/String; = "set_attribute"

.field public static final SET_STATE:Ljava/lang/String; = "set_state"

.field public static final TIME_SYNC:Ljava/lang/String; = "TimeSync"

.field public static final UPDATE_DEVICE:Ljava/lang/String; = "update"

.field public static final UPDATE_FIRMWARE:Ljava/lang/String; = "update_firmware"

.field private static mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;


# instance fields
.field private final ADD_DEVICE_TO_CACHE:I

.field private final GET_DEVICE_BY_SID:I

.field private final GET_DEVICE_BY_UDN:I

.field private final GET_DEVICE_LIST:I

.field private final REMOVE_DEVICE_FROM_CACHE:I

.field private TAG:Ljava/lang/String;

.field private checkIfServiceFilesReload:Z

.field private context:Landroid/content/Context;

.field private isNotificationComes:Z

.field private lastSSID:Ljava/lang/String;

.field private mActiveDeviceList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/localsdk/WeMoDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

.field private mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/CopyOnWriteArrayList",
            "<",
            "Lcom/belkin/wemo/localsdk/WeMoDevice;",
            ">;"
        }
    .end annotation
.end field

.field private mListeners:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;",
            ">;"
        }
    .end annotation
.end field

.field private mutex:Ljava/lang/Object;

.field private serviceFilesSynched:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 113
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v2, 0x0

    const/4 v1, 0x0

    .line 174
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mListeners:Ljava/util/ArrayList;

    .line 91
    const-string v0, "WeMoSDKContext"

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    .line 100
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 104
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 107
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    .line 108
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->serviceFilesSynched:Z

    .line 109
    iput-boolean v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    .line 111
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mutex:Ljava/lang/Object;

    .line 114
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mActiveDeviceList:Ljava/util/ArrayList;

    .line 115
    iput-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->context:Landroid/content/Context;

    .line 116
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    .line 1264
    iput v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->GET_DEVICE_BY_UDN:I

    .line 1265
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->GET_DEVICE_BY_SID:I

    .line 1266
    const/4 v0, 0x2

    iput v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->GET_DEVICE_LIST:I

    .line 1267
    const/4 v0, 0x3

    iput v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->ADD_DEVICE_TO_CACHE:I

    .line 1268
    const/4 v0, 0x4

    iput v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->REMOVE_DEVICE_FROM_CACHE:I

    .line 175
    invoke-static {p1}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    .line 176
    iput-object p1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->context:Landroid/content/Context;

    .line 177
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 178
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mActiveDeviceList:Ljava/util/ArrayList;

    .line 179
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 180
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->initControlPoint(Landroid/content/Context;)V

    .line 182
    :cond_0
    const-string v0, "ZZZ"

    const-string v1, "WeMoSDKContext constructor call"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    return-void
.end method

.method static synthetic access$002(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .prologue
    .line 44
    sput-object p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    return-object p0
.end method

.method static synthetic access$100(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Lorg/cybergarage/upnp/ControlPoint;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/lang/String;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$300(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)Ljava/util/concurrent/CopyOnWriteArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoDevice;)Z
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p1, "x1"    # Lcom/belkin/wemo/localsdk/WeMoDevice;

    .prologue
    .line 44
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->updateWeMoDevice(Lcom/belkin/wemo/localsdk/WeMoDevice;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$800(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .param p1, "x1"    # Lorg/cybergarage/upnp/Action;
    .param p2, "x2"    # [Ljava/lang/String;
    .param p3, "x3"    # [Ljava/lang/String;

    .prologue
    .line 44
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V

    return-void
.end method

.method private checkIfServiceFilesReload(Lorg/cybergarage/upnp/Device;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "firmwareVersion"    # Ljava/lang/String;
    .param p3, "serialNumber"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 1344
    const/4 v0, 0x0

    .line 1345
    .local v0, "cachedFWVersion":Ljava/lang/String;
    const/4 v1, 0x0

    .line 1347
    .local v1, "currentFWVersion":Ljava/lang/String;
    :try_start_0
    iget-boolean v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    if-eqz v3, :cond_0

    .line 1380
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    .line 1383
    :goto_0
    return-void

    .line 1348
    :cond_0
    const/4 v3, 0x1

    :try_start_1
    iput-boolean v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    .line 1349
    if-eqz p2, :cond_4

    .line 1351
    move-object v1, p2

    .line 1352
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getFirmwareVersion()Ljava/lang/String;

    move-result-object v0

    .line 1353
    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

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

    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mutex:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1354
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

    .line 1380
    :cond_1
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    goto :goto_0

    .line 1356
    :cond_2
    :try_start_2
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mutex:Ljava/lang/Object;

    monitor-enter v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 1357
    :try_start_3
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 1359
    invoke-direct {p0, p1, p3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V

    .line 1363
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1374
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

    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mutex:Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/Object;->hashCode()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-boolean v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->serviceFilesSynched:Z

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1380
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 1362
    :cond_3
    :try_start_5
    monitor-exit v4
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 1380
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 1363
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

    .line 1375
    :catch_0
    move-exception v2

    .line 1376
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

    invoke-virtual {v2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 1380
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 1367
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_4
    :try_start_9
    iget-boolean v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->serviceFilesSynched:Z
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-eqz v3, :cond_5

    .line 1380
    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    goto/16 :goto_0

    .line 1369
    :cond_5
    :try_start_a
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mutex:Ljava/lang/Object;

    monitor-enter v4
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    .line 1370
    :try_start_b
    invoke-direct {p0, p1, p3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V

    .line 1371
    const/4 v3, 0x1

    iput-boolean v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->serviceFilesSynched:Z

    .line 1372
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

    .line 1380
    :catchall_2
    move-exception v3

    iput-boolean v6, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload:Z

    throw v3
.end method

.method private createAttributeList(Lorg/json/JSONObject;)Ljava/lang/String;
    .locals 8
    .param p1, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    .line 531
    new-instance v4, Ljava/lang/StringBuffer;

    invoke-direct {v4}, Ljava/lang/StringBuffer;-><init>()V

    .line 534
    .local v4, "str":Ljava/lang/StringBuffer;
    :try_start_0
    invoke-virtual {p1}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v3

    .line 535
    .local v3, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 537
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 538
    .local v0, "attributeKey":Ljava/lang/String;
    const-string v5, "<attribute>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 539
    const-string v5, "<name>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 540
    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 541
    .local v1, "attributeObejct":Lorg/json/JSONObject;
    invoke-virtual {v4, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 542
    const-string v5, "</name>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 543
    const-string v5, "<value>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 544
    const-string v5, "value"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 545
    const-string v5, "</value>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 546
    const-string v5, "</attribute>"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 549
    .end local v0    # "attributeKey":Ljava/lang/String;
    .end local v1    # "attributeObejct":Lorg/json/JSONObject;
    .end local v3    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v2

    .line 551
    .local v2, "e":Lorg/json/JSONException;
    invoke-virtual {v2}, Lorg/json/JSONException;->printStackTrace()V

    .line 553
    .end local v2    # "e":Lorg/json/JSONException;
    :cond_0
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

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

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 554
    invoke-virtual {v4}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v5

    return-object v5
.end method

.method private createAttributeList(Lorg/json/JSONObject;Lcom/belkin/wemo/localsdk/WeMoDevice;)Ljava/lang/String;
    .locals 12
    .param p1, "attributes"    # Lorg/json/JSONObject;
    .param p2, "wemDevice"    # Lcom/belkin/wemo/localsdk/WeMoDevice;

    .prologue
    .line 489
    const/4 v9, 0x4

    new-array v0, v9, [Ljava/lang/String;

    const/4 v9, 0x0

    const-string v10, "Switch"

    aput-object v10, v0, v9

    const/4 v9, 0x1

    const-string v10, "Sensor"

    aput-object v10, v0, v9

    const/4 v9, 0x2

    const-string v10, "SwitchMode"

    aput-object v10, v0, v9

    const/4 v9, 0x3

    const-string v10, "SensorPresent"

    aput-object v10, v0, v9

    .line 490
    .local v0, "arr":[Ljava/lang/String;
    new-instance v8, Ljava/lang/StringBuffer;

    invoke-direct {v8}, Ljava/lang/StringBuffer;-><init>()V

    .line 492
    .local v8, "str":Ljava/lang/StringBuffer;
    :try_start_0
    invoke-virtual {p2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v9

    invoke-virtual {v9}, Lorg/cybergarage/upnp/Device;->getAttributeList()Lorg/json/JSONObject;

    move-result-object v3

    .line 494
    .local v3, "attributeList":Lorg/json/JSONObject;
    new-instance v3, Lorg/json/JSONObject;

    .end local v3    # "attributeList":Lorg/json/JSONObject;
    invoke-virtual {p2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getAttribute()Ljava/lang/String;

    move-result-object v9

    invoke-direct {v3, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 495
    .restart local v3    # "attributeList":Lorg/json/JSONObject;
    const/4 v5, 0x0

    .local v5, "count":I
    :goto_0
    array-length v9, v0

    if-ge v5, v9, :cond_2

    .line 497
    invoke-virtual {v3}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v7

    .line 498
    .local v7, "setterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_3

    .line 500
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 501
    .local v2, "attributeKey":Ljava/lang/String;
    const/4 v4, 0x0

    .line 503
    .local v4, "attributevalue":Ljava/lang/String;
    :try_start_1
    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v4

    .line 505
    :goto_2
    :try_start_2
    aget-object v9, v0, v5

    invoke-virtual {v9, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_0

    .line 507
    const-string v9, "<attribute>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 508
    const-string v9, "<name>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 509
    invoke-virtual {v8, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 510
    const-string v9, "</name>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 511
    const-string v9, "<value>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 512
    const-string v9, "null"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    const/4 v9, 0x0

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    const-string v9, ""

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-nez v9, :cond_1

    .line 513
    invoke-virtual {v3, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 514
    .local v1, "attributeJson":Lorg/json/JSONObject;
    const-string v9, "value"

    invoke-virtual {v1, v9, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 516
    .end local v1    # "attributeJson":Lorg/json/JSONObject;
    :cond_1
    invoke-virtual {v8, v4}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 517
    const-string v9, "</value>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 518
    const-string v9, "</attribute>"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    .line 522
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v3    # "attributeList":Lorg/json/JSONObject;
    .end local v4    # "attributevalue":Ljava/lang/String;
    .end local v5    # "count":I
    .end local v7    # "setterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_0
    move-exception v6

    .line 524
    .local v6, "e":Lorg/json/JSONException;
    invoke-virtual {v6}, Lorg/json/JSONException;->printStackTrace()V

    .line 526
    .end local v6    # "e":Lorg/json/JSONException;
    :cond_2
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, ".createAttributeList"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "str.toString():::::::;"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 527
    invoke-virtual {v8}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v9

    return-object v9

    .line 504
    .restart local v2    # "attributeKey":Ljava/lang/String;
    .restart local v3    # "attributeList":Lorg/json/JSONObject;
    .restart local v4    # "attributevalue":Ljava/lang/String;
    .restart local v5    # "count":I
    .restart local v7    # "setterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_1
    move-exception v6

    .local v6, "e":Ljava/lang/Exception;
    :try_start_3
    invoke-virtual {v6}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0

    goto/16 :goto_2

    .line 495
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v4    # "attributevalue":Ljava/lang/String;
    .end local v6    # "e":Ljava/lang/Exception;
    :cond_3
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_0
.end method

.method public static getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p0, "udn"    # Ljava/lang/String;

    .prologue
    .line 725
    const-string v0, ":switch:sensor"

    const-string v1, ":sensor:switch"

    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p0

    .line 726
    return-object p0
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 125
    const-class v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-nez v0, :cond_0

    .line 126
    new-instance v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 129
    :cond_0
    sget-object v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 125
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method private getSSID(Landroid/content/Context;)Ljava/lang/String;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 1243
    const-string v3, "wifi"

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/wifi/WifiManager;

    .line 1244
    .local v0, "manager":Landroid/net/wifi/WifiManager;
    invoke-virtual {v0}, Landroid/net/wifi/WifiManager;->getConnectionInfo()Landroid/net/wifi/WifiInfo;

    move-result-object v2

    .line 1245
    .local v2, "wifiInfo":Landroid/net/wifi/WifiInfo;
    invoke-virtual {v2}, Landroid/net/wifi/WifiInfo;->getSSID()Ljava/lang/String;

    move-result-object v1

    .line 1246
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

.method private getWeMoDeviceBySID(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;
    .locals 1
    .param p1, "sid"    # Ljava/lang/String;

    .prologue
    .line 1261
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->performActionWithCache(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/localsdk/WeMoDevice;

    return-object v0
.end method

.method public static declared-synchronized getWeMoSDKInstance()Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    .locals 2

    .prologue
    .line 132
    const-class v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    monitor-enter v0

    :try_start_0
    sget-object v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mWeMoSDKInstance:Lcom/belkin/wemo/localsdk/WeMoSDKContext;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private initControlPoint(Landroid/content/Context;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 186
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->stop()Z

    .line 190
    :cond_0
    new-instance v1, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v1}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 192
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 193
    .local v0, "ssid":Ljava/lang/String;
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/ControlPoint;->setSSID(Ljava/lang/String;)V

    .line 194
    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    .line 196
    iget-object v1, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ControlPoint;->start()Z

    .line 199
    const-wide/16 v2, 0x64

    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 201
    :goto_0
    invoke-direct {p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->startListen()V

    .line 202
    return-void

    .line 200
    :catch_0
    move-exception v1

    goto :goto_0
.end method

.method private isSmart(Ljava/lang/String;)Z
    .locals 1
    .param p1, "deviceType"    # Ljava/lang/String;

    .prologue
    .line 1152
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

    .line 1154
    :cond_0
    const/4 v0, 0x1

    .line 1157
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isUDNinList(Ljava/lang/String;)Z
    .locals 3
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 944
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mActiveDeviceList:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 945
    .local v0, "dev":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 946
    const/4 v2, 0x1

    .line 950
    .end local v0    # "dev":Lcom/belkin/wemo/localsdk/WeMoDevice;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method private declared-synchronized performActionWithCache(ILjava/lang/Object;)Ljava/lang/Object;
    .locals 9
    .param p1, "type"    # I
    .param p2, "parameter"    # Ljava/lang/Object;

    .prologue
    .line 1271
    monitor-enter p0

    const/4 v2, 0x0

    .line 1272
    .local v2, "response":Ljava/lang/Object;
    packed-switch p1, :pswitch_data_0

    .line 1316
    .end local v2    # "response":Ljava/lang/Object;
    .end local p2    # "parameter":Ljava/lang/Object;
    :cond_0
    :goto_0
    monitor-exit p0

    return-object v2

    .line 1275
    .restart local v2    # "response":Ljava/lang/Object;
    .restart local p2    # "parameter":Ljava/lang/Object;
    :pswitch_0
    :try_start_0
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "response":Ljava/lang/Object;
    .local v1, "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 1276
    .local v6, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v8

    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    move-object v7, v0

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1277
    move-object v2, v6

    .local v2, "response":Lcom/belkin/wemo/localsdk/WeMoDevice;
    goto :goto_1

    .line 1283
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v6    # "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    .local v2, "response":Ljava/lang/Object;
    :pswitch_1
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .end local v2    # "response":Ljava/lang/Object;
    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_2
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 1284
    .restart local v6    # "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v8

    move-object v0, p2

    check-cast v0, Ljava/lang/String;

    move-object v7, v0

    invoke-virtual {v8, v7}, Lorg/cybergarage/upnp/Device;->getSubscriberService(Ljava/lang/String;)Lorg/cybergarage/upnp/Service;

    move-result-object v7

    if-eqz v7, :cond_2

    .line 1285
    move-object v2, v6

    .local v2, "response":Lcom/belkin/wemo/localsdk/WeMoDevice;
    goto :goto_2

    .line 1291
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v6    # "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    .local v2, "response":Ljava/lang/Object;
    :pswitch_2
    new-instance v3, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v3}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 1292
    .local v3, "result":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Ljava/lang/String;>;"
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .restart local v1    # "i$":Ljava/util/Iterator;
    :cond_3
    :goto_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 1293
    .local v5, "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->isAvailable()Z

    move-result v7

    if-eqz v7, :cond_3

    .line 1294
    invoke-virtual {v5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v3, v7}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_3

    .line 1271
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v2    # "response":Ljava/lang/Object;
    .end local v3    # "result":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Ljava/lang/String;>;"
    .end local v5    # "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    .end local p2    # "parameter":Ljava/lang/Object;
    :catchall_0
    move-exception v7

    monitor-exit p0

    throw v7

    .line 1297
    .restart local v1    # "i$":Ljava/util/Iterator;
    .restart local v2    # "response":Ljava/lang/Object;
    .restart local v3    # "result":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Ljava/lang/String;>;"
    .restart local p2    # "parameter":Ljava/lang/Object;
    :cond_4
    move-object v2, v3

    .line 1298
    .local v2, "response":Ljava/util/concurrent/CopyOnWriteArrayList;
    goto :goto_0

    .line 1301
    .end local v1    # "i$":Ljava/util/Iterator;
    .end local v3    # "result":Ljava/util/concurrent/CopyOnWriteArrayList;, "Ljava/util/concurrent/CopyOnWriteArrayList<Ljava/lang/String;>;"
    .local v2, "response":Ljava/lang/Object;
    :pswitch_3
    :try_start_1
    move-object v0, p2

    check-cast v0, Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-object v7, v0

    invoke-virtual {v7}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v4

    .line 1303
    .local v4, "udn":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v7

    if-nez v7, :cond_5

    .line 1304
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast p2, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .end local p2    # "parameter":Ljava/lang/Object;
    invoke-virtual {v7, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->add(Ljava/lang/Object;)Z

    .line 1305
    const/4 v7, 0x1

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .local v2, "response":Ljava/lang/Boolean;
    goto/16 :goto_0

    .line 1308
    .local v2, "response":Ljava/lang/Object;
    .restart local p2    # "parameter":Ljava/lang/Object;
    :cond_5
    const/4 v7, 0x0

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    .line 1310
    .local v2, "response":Ljava/lang/Boolean;
    goto/16 :goto_0

    .line 1313
    .end local v4    # "udn":Ljava/lang/String;
    .local v2, "response":Ljava/lang/Object;
    :pswitch_4
    iget-object v7, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    check-cast p2, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .end local p2    # "parameter":Ljava/lang/Object;
    invoke-virtual {v7, p2}, Ljava/util/concurrent/CopyOnWriteArrayList;->remove(Ljava/lang/Object;)Z

    move-result v7

    invoke-static {v7}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-result-object v2

    .local v2, "response":Ljava/lang/Boolean;
    goto/16 :goto_0

    .line 1272
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method private saveDeviceCache()V
    .locals 8

    .prologue
    .line 369
    :try_start_0
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 370
    .local v4, "listJSONObject":Lorg/json/JSONObject;
    iget-object v5, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v5}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/localsdk/WeMoDevice;

    .line 371
    .local v0, "cacheDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->isAvailable()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 372
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    .line 374
    .local v3, "itemJSONObject":Lorg/json/JSONObject;
    const-string v5, "friendlyName"

    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getFriendlyName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 375
    const-string v5, "type"

    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getType()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 376
    const-string v5, "udn"

    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 377
    const-string v5, "iconUrl"

    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getLogo()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 379
    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 383
    .end local v0    # "cacheDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    .end local v2    # "i$":Ljava/util/Iterator;
    .end local v3    # "itemJSONObject":Lorg/json/JSONObject;
    .end local v4    # "listJSONObject":Lorg/json/JSONObject;
    :catch_0
    move-exception v1

    .line 384
    .local v1, "e":Lorg/json/JSONException;
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v5

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Save device cache error "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v1}, Lorg/json/JSONException;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 386
    .end local v1    # "e":Lorg/json/JSONException;
    :goto_1
    return-void

    .line 382
    .restart local v2    # "i$":Ljava/util/Iterator;
    .restart local v4    # "listJSONObject":Lorg/json/JSONObject;
    :cond_1
    const/4 v5, 0x0

    :try_start_1
    invoke-static {v5}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v5

    invoke-virtual {v4}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/storage/FileStorage;->saveDeviceCache(Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1
.end method

.method private sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "event"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "udn"    # Ljava/lang/String;

    .prologue
    .line 1182
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;

    .line 1183
    .local v1, "listener":Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;
    if-eqz v1, :cond_0

    .line 1184
    invoke-interface {v1, p1, p2, p3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;->onNotify(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 1187
    .end local v1    # "listener":Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;
    :cond_1
    return-void
.end method

.method private setArgument(Lorg/cybergarage/upnp/Action;[Ljava/lang/String;[Ljava/lang/String;)V
    .locals 3
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;
    .param p2, "keys"    # [Ljava/lang/String;
    .param p3, "values"    # [Ljava/lang/String;

    .prologue
    .line 1168
    if-eqz p1, :cond_0

    if-eqz p2, :cond_0

    if-eqz p3, :cond_0

    .line 1169
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    .line 1170
    aget-object v1, p2, v0

    aget-object v2, p3, v0

    invoke-virtual {p1, v1, v2}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 1169
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1173
    .end local v0    # "i":I
    :cond_0
    return-void
.end method

.method private startListen()V
    .locals 1

    .prologue
    .line 978
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v0, :cond_0

    .line 979
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V

    .line 980
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->addEventListener(Lorg/cybergarage/upnp/event/EventListener;)V

    .line 982
    :cond_0
    return-void
.end method

.method private stopListen()V
    .locals 1

    .prologue
    .line 1192
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v0, :cond_0

    .line 1193
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->removeDeviceChangeListener(Lorg/cybergarage/upnp/device/DeviceChangeListener;)V

    .line 1194
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/ControlPoint;->removeEventListener(Lorg/cybergarage/upnp/event/EventListener;)V

    .line 1196
    :cond_0
    return-void
.end method

.method private subscribeToService(Lorg/cybergarage/upnp/Device;)Z
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 1214
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getServiceList()Lorg/cybergarage/upnp/ServiceList;

    move-result-object v2

    .line 1215
    .local v2, "serviceList":Lorg/cybergarage/upnp/ServiceList;
    const/4 v0, 0x0

    .local v0, "j":I
    :goto_0
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ServiceList;->size()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 1216
    invoke-virtual {v2, v0}, Lorg/cybergarage/upnp/ServiceList;->getService(I)Lorg/cybergarage/upnp/Service;

    move-result-object v1

    .line 1217
    .local v1, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/Service;->getServiceType()Ljava/lang/String;

    move-result-object v3

    .line 1219
    .local v3, "type":Ljava/lang/String;
    const-string v4, "urn:Belkin:service:basicevent:1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "urn:Belkin:service:firmwareupdate:1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "urn:Belkin:service:timesync:1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "urn:Belkin:service:bridge:1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v4, "urn:Belkin:service:deviceevent:1"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isSmart(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 1224
    :cond_0
    const-string v4, "sdk wemosdkcontext: inside"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "sdk wemosdkcontext: inside"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1225
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v4, v1}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1227
    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v4, v1}, Lorg/cybergarage/upnp/ControlPoint;->subscribe(Lorg/cybergarage/upnp/Service;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 1228
    const/4 v4, 0x0

    .line 1233
    .end local v1    # "service":Lorg/cybergarage/upnp/Service;
    .end local v3    # "type":Ljava/lang/String;
    :goto_1
    return v4

    .line 1215
    .restart local v1    # "service":Lorg/cybergarage/upnp/Service;
    .restart local v3    # "type":Ljava/lang/String;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 1233
    .end local v1    # "service":Lorg/cybergarage/upnp/Service;
    .end local v3    # "type":Ljava/lang/String;
    :cond_2
    const/4 v4, 0x1

    goto :goto_1
.end method

.method private synchFiles(Lorg/cybergarage/upnp/Device;Ljava/lang/String;)V
    .locals 6
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "serialNumber"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;,
            Lorg/cybergarage/xml/ParserException;
        }
    .end annotation

    .prologue
    .line 1326
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Device;->getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocation()Ljava/lang/String;

    move-result-object v1

    .line 1327
    .local v1, "location":Ljava/lang/String;
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1328
    .local v2, "locationUrl":Ljava/net/URL;
    const/4 v3, 0x0

    invoke-static {v3}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v0

    .line 1329
    .local v0, "fs":Lcom/belkin/wemo/storage/FileStorage;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/storage/FileStorage;->setReload(Z)V

    .line 1330
    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "syncFiles function is called :: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1331
    invoke-virtual {v0, v2, p2}, Lcom/belkin/wemo/storage/FileStorage;->getDescriptionFile(Ljava/net/URL;Ljava/lang/String;)Ljava/io/File;

    .line 1332
    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v3, :cond_0

    .line 1333
    iget-object v3, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v3, p1}, Lorg/cybergarage/upnp/ControlPoint;->updateDevice(Lorg/cybergarage/upnp/Device;)V

    .line 1335
    :cond_0
    return-void
.end method

.method private updateAttributeList(Ljava/lang/String;Lcom/belkin/wemo/localsdk/WeMoDevice;)Ljava/lang/String;
    .locals 16
    .param p1, "attribute"    # Ljava/lang/String;
    .param p2, "wemodevice"    # Lcom/belkin/wemo/localsdk/WeMoDevice;

    .prologue
    .line 834
    const/4 v6, 0x0

    .line 835
    .local v6, "preAttributeListJson":Lorg/json/JSONObject;
    new-instance v12, Ljava/lang/StringBuffer;

    invoke-direct {v12}, Ljava/lang/StringBuffer;-><init>()V

    .line 836
    .local v12, "xmlString":Ljava/lang/StringBuffer;
    const-string v13, "<attributelist>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 837
    move-object/from16 v0, p1

    invoke-virtual {v12, v0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 838
    const-string v13, "</attributelist>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 839
    new-instance v13, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;

    invoke-direct {v13}, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;-><init>()V

    invoke-virtual {v12}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Lcom/belkin/wemo/localsdk/parser/AttributeNotificationParser;->parseAttributeRespone(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    .line 841
    .local v11, "updateAttributeJson":Lorg/json/JSONObject;
    if-eqz v11, :cond_1

    .line 843
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getAttribute()Ljava/lang/String;

    move-result-object v13

    invoke-direct {v7, v13}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 845
    .end local v6    # "preAttributeListJson":Lorg/json/JSONObject;
    .local v7, "preAttributeListJson":Lorg/json/JSONObject;
    :try_start_1
    invoke-virtual {v11}, Lorg/json/JSONObject;->keys()Ljava/util/Iterator;

    move-result-object v5

    .line 846
    .local v5, "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :cond_0
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_6

    .line 848
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 849
    .local v2, "attributeKey":Ljava/lang/String;
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v13

    if-eqz v13, :cond_0

    .line 850
    invoke-virtual {v11, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    .line 851
    .local v10, "updateAttributeItemJson":Lorg/json/JSONObject;
    invoke-virtual {v7, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v8

    .line 853
    .local v8, "prevAttributeItemJson":Lorg/json/JSONObject;
    const-string v13, "value"

    invoke-virtual {v10, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 854
    .local v3, "currentvalue":Ljava/lang/String;
    const-string v13, "value"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    .line 856
    .local v9, "prevvalue":Ljava/lang/String;
    invoke-virtual/range {p2 .. p2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v13

    invoke-virtual {v13}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p0

    invoke-direct {v0, v13}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isSmart(Ljava/lang/String;)Z

    move-result v13

    if-nez v13, :cond_5

    .line 857
    const-string v13, "SwitchMode"

    invoke-virtual {v7, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    .line 858
    .local v1, "attributeItemJson":Lorg/json/JSONObject;
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Notification for"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 859
    const-string v13, "value"

    invoke-virtual {v1, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    const-string v14, "1"

    invoke-virtual {v13, v14}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 860
    const-string v13, "Switch"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_2

    .line 862
    const/4 v13, 0x0

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    .line 863
    const-string v13, "0"

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 864
    const-string v13, "value"

    const-string v14, "0"

    invoke-virtual {v8, v13, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0

    .line 890
    .end local v1    # "attributeItemJson":Lorg/json/JSONObject;
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v3    # "currentvalue":Ljava/lang/String;
    .end local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .end local v8    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .end local v9    # "prevvalue":Ljava/lang/String;
    .end local v10    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :catch_0
    move-exception v4

    move-object v6, v7

    .line 891
    .end local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    .local v4, "e":Lorg/json/JSONException;
    .restart local v6    # "preAttributeListJson":Lorg/json/JSONObject;
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    .line 895
    .end local v4    # "e":Lorg/json/JSONException;
    :cond_1
    :goto_2
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "change preAttributeListJson"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 896
    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v13

    return-object v13

    .line 866
    .end local v6    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v1    # "attributeItemJson":Lorg/json/JSONObject;
    .restart local v2    # "attributeKey":Ljava/lang/String;
    .restart local v3    # "currentvalue":Ljava/lang/String;
    .restart local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    .restart local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v8    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .restart local v9    # "prevvalue":Ljava/lang/String;
    .restart local v10    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :cond_2
    const/4 v13, 0x1

    :try_start_2
    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    .line 867
    const-string v13, "value"

    invoke-virtual {v8, v13, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 871
    :cond_3
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 873
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    .line 874
    const-string v13, "Switch"

    invoke-virtual {v2, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_4

    .line 875
    const-string v13, "value"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 877
    :cond_4
    const-string v13, "value"

    invoke-virtual {v8, v13, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    goto/16 :goto_0

    .line 880
    .end local v1    # "attributeItemJson":Lorg/json/JSONObject;
    :cond_5
    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 881
    const-string v13, "value"

    invoke-virtual {v8, v13}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    move-object/from16 v0, p2

    invoke-virtual {v0, v13}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 882
    const-string v13, "value"

    invoke-virtual {v8, v13, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 883
    move-object/from16 v0, p0

    iget-object v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "SMART: isNotificationComes comes attributeKey ::"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 884
    const/4 v13, 0x1

    move-object/from16 v0, p0

    iput-boolean v13, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    goto/16 :goto_0

    .line 889
    .end local v2    # "attributeKey":Ljava/lang/String;
    .end local v3    # "currentvalue":Ljava/lang/String;
    .end local v8    # "prevAttributeItemJson":Lorg/json/JSONObject;
    .end local v9    # "prevvalue":Ljava/lang/String;
    .end local v10    # "updateAttributeItemJson":Lorg/json/JSONObject;
    :cond_6
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, ".updateAttributeList"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "updateAttributeJsons "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v11}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v13, v14}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->verboseLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    move-object v6, v7

    .line 892
    .end local v7    # "preAttributeListJson":Lorg/json/JSONObject;
    .restart local v6    # "preAttributeListJson":Lorg/json/JSONObject;
    goto/16 :goto_2

    .line 890
    .end local v5    # "getterKeyIterator":Ljava/util/Iterator;, "Ljava/util/Iterator<*>;"
    :catch_1
    move-exception v4

    goto/16 :goto_1
.end method

.method private updateWeMoDevice(Lcom/belkin/wemo/localsdk/WeMoDevice;)Z
    .locals 32
    .param p1, "wemoDevice"    # Lcom/belkin/wemo/localsdk/WeMoDevice;

    .prologue
    .line 992
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    move-object/from16 v29, v0

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, " on updateWeMoDevice is called in WEMOSDKCONTEXT :: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v31

    invoke-virtual/range {v31 .. v31}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 994
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v15

    .line 995
    .local v15, "device":Lorg/cybergarage/upnp/Device;
    const/16 v17, 0x0

    .line 996
    .local v17, "deviceInformation":[Ljava/lang/String;
    const-string v23, ""

    .line 997
    .local v23, "friendlyName":Ljava/lang/String;
    const-string v9, ""

    .line 998
    .local v9, "binaryState":Ljava/lang/String;
    const-string v25, ""

    .line 999
    .local v25, "iconVersion":Ljava/lang/String;
    const-string v11, ""

    .line 1000
    .local v11, "configureState":Ljava/lang/String;
    const-string v14, ""

    .line 1001
    .local v14, "customizedState":Ljava/lang/String;
    const-string v22, ""

    .line 1002
    .local v22, "firmwareVersion":Ljava/lang/String;
    const-string v12, ""

    .line 1003
    .local v12, "countDownEndTime":Ljava/lang/String;
    const-string v24, ""

    .line 1004
    .local v24, "hwVersion":Ljava/lang/String;
    const-string v26, ""

    .line 1005
    .local v26, "macAddress":Ljava/lang/String;
    const-string v10, ""

    .line 1006
    .local v10, "brandName":Ljava/lang/String;
    const-string v27, ""

    .line 1007
    .local v27, "productName":Ljava/lang/String;
    const-string v29, "GetInformation"

    move-object/from16 v0, v29

    invoke-virtual {v15, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v5

    .line 1008
    .local v5, "actionGetInformation":Lorg/cybergarage/upnp/Action;
    const-string v29, "GetDeviceInformation"

    move-object/from16 v0, v29

    invoke-virtual {v15, v0}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v4

    .line 1009
    .local v4, "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    const/4 v13, 0x0

    .line 1010
    .local v13, "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v5, :cond_7

    .line 1012
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getCustomizedInformationFromDevice()Ljava/util/Map;

    move-result-object v13

    .line 1013
    if-eqz v13, :cond_6

    .line 1015
    const-string v29, "firmwareVersion"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v22

    .end local v22    # "firmwareVersion":Ljava/lang/String;
    check-cast v22, Ljava/lang/String;

    .line 1016
    .restart local v22    # "firmwareVersion":Ljava/lang/String;
    const-string v29, "FriendlyName"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v23

    .end local v23    # "friendlyName":Ljava/lang/String;
    check-cast v23, Ljava/lang/String;

    .line 1017
    .restart local v23    # "friendlyName":Ljava/lang/String;
    const-string v29, "binaryState"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    .end local v9    # "binaryState":Ljava/lang/String;
    check-cast v9, Ljava/lang/String;

    .line 1018
    .restart local v9    # "binaryState":Ljava/lang/String;
    const-string v29, "iconVersion"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v25

    .end local v25    # "iconVersion":Ljava/lang/String;
    check-cast v25, Ljava/lang/String;

    .line 1019
    .restart local v25    # "iconVersion":Ljava/lang/String;
    const-string v29, "CustomizedState"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    .end local v14    # "customizedState":Ljava/lang/String;
    check-cast v14, Ljava/lang/String;

    .line 1020
    .restart local v14    # "customizedState":Ljava/lang/String;
    const-string v29, "CountdownEndTime"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .end local v12    # "countDownEndTime":Ljava/lang/String;
    check-cast v12, Ljava/lang/String;

    .line 1021
    .restart local v12    # "countDownEndTime":Ljava/lang/String;
    const-string v29, "hwVersion"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v24

    .end local v24    # "hwVersion":Ljava/lang/String;
    check-cast v24, Ljava/lang/String;

    .line 1022
    .restart local v24    # "hwVersion":Ljava/lang/String;
    const-string v29, "macAddress"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v26

    .end local v26    # "macAddress":Ljava/lang/String;
    check-cast v26, Ljava/lang/String;

    .line 1023
    .restart local v26    # "macAddress":Ljava/lang/String;
    const-string v29, "brandName"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    if-eqz v29, :cond_0

    .line 1024
    const-string v29, "brandName"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    .end local v10    # "brandName":Ljava/lang/String;
    check-cast v10, Ljava/lang/String;

    .line 1027
    .restart local v10    # "brandName":Ljava/lang/String;
    :cond_0
    const-string v29, "productName"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v29

    if-eqz v29, :cond_1

    .line 1028
    const-string v29, "productName"

    move-object/from16 v0, v29

    invoke-interface {v13, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v27

    .end local v27    # "productName":Ljava/lang/String;
    check-cast v27, Ljava/lang/String;

    .line 1031
    .restart local v27    # "productName":Ljava/lang/String;
    :cond_1
    if-eqz v24, :cond_2

    invoke-virtual/range {v24 .. v24}, Ljava/lang/String;->isEmpty()Z

    move-result v29

    if-eqz v29, :cond_3

    .line 1032
    :cond_2
    const-string v24, "v1"

    .line 1047
    :cond_3
    :goto_0
    const-string v29, "WeMoSDK"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "WeMoSDKContext : updateWeMoDevice customizedInformation: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " friendlyName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " binaryState: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " iconVersion: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v25

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " udn: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " macAddress : "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " countDownEndTime : "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " hash: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual {v15}, Ljava/lang/Object;->hashCode()I

    move-result v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " brandName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " productName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1067
    :cond_4
    :goto_1
    if-eqz v9, :cond_5

    const-string v29, ""

    move-object/from16 v0, v29

    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_b

    .line 1068
    :cond_5
    const-string v29, "WeMoSDK"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "WeMoSDKContext : remove "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1069
    const/16 v29, 0x0

    .line 1148
    .end local v4    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .end local v5    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .end local v9    # "binaryState":Ljava/lang/String;
    .end local v10    # "brandName":Ljava/lang/String;
    .end local v11    # "configureState":Ljava/lang/String;
    .end local v12    # "countDownEndTime":Ljava/lang/String;
    .end local v13    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v14    # "customizedState":Ljava/lang/String;
    .end local v15    # "device":Lorg/cybergarage/upnp/Device;
    .end local v17    # "deviceInformation":[Ljava/lang/String;
    .end local v22    # "firmwareVersion":Ljava/lang/String;
    .end local v23    # "friendlyName":Ljava/lang/String;
    .end local v24    # "hwVersion":Ljava/lang/String;
    .end local v25    # "iconVersion":Ljava/lang/String;
    .end local v26    # "macAddress":Ljava/lang/String;
    .end local v27    # "productName":Ljava/lang/String;
    :goto_2
    return v29

    .line 1037
    .restart local v4    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .restart local v5    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .restart local v9    # "binaryState":Ljava/lang/String;
    .restart local v10    # "brandName":Ljava/lang/String;
    .restart local v11    # "configureState":Ljava/lang/String;
    .restart local v12    # "countDownEndTime":Ljava/lang/String;
    .restart local v13    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v14    # "customizedState":Ljava/lang/String;
    .restart local v15    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v17    # "deviceInformation":[Ljava/lang/String;
    .restart local v22    # "firmwareVersion":Ljava/lang/String;
    .restart local v23    # "friendlyName":Ljava/lang/String;
    .restart local v24    # "hwVersion":Ljava/lang/String;
    .restart local v25    # "iconVersion":Ljava/lang/String;
    .restart local v26    # "macAddress":Ljava/lang/String;
    .restart local v27    # "productName":Ljava/lang/String;
    :cond_6
    if-eqz v4, :cond_3

    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_3

    .line 1039
    const/16 v29, 0x5

    aget-object v23, v17, v29

    .line 1040
    const/16 v29, 0x4

    aget-object v9, v17, v29

    .line 1041
    const/16 v29, 0x2

    aget-object v25, v17, v29

    .line 1042
    const/16 v29, 0x1

    aget-object v22, v17, v29

    .line 1043
    const/16 v29, 0x0

    aget-object v26, v17, v29

    .line 1044
    move-object/from16 v0, v17

    array-length v0, v0

    move/from16 v29, v0

    const/16 v30, 0x6

    move/from16 v0, v29

    move/from16 v1, v30

    if-le v0, v1, :cond_3

    .line 1045
    const/16 v29, 0x6

    aget-object v10, v17, v29

    goto/16 :goto_0

    .line 1050
    :cond_7
    if-nez v4, :cond_a

    .line 1052
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getFriendlyNameFromDevice()Ljava/lang/String;

    move-result-object v23

    .line 1053
    const-string v29, "WeMoSDK"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "WeMoSDKContext : updateWeMoDevice friendlyName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1054
    if-eqz v23, :cond_8

    invoke-virtual/range {v23 .. v23}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/String;->length()I

    move-result v29

    if-nez v29, :cond_9

    .line 1055
    :cond_8
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getFriendlyName()Ljava/lang/String;

    move-result-object v23

    .line 1056
    :cond_9
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getMacAddress()Ljava/lang/String;

    move-result-object v26

    .line 1057
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getBinaryStateFromDevice()Ljava/lang/String;

    move-result-object v9

    .line 1058
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getFirmwareVersionFromDevice()Ljava/lang/String;

    move-result-object v22

    goto/16 :goto_1

    .line 1059
    :cond_a
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getDeviceInformationFromDevice()[Ljava/lang/String;

    move-result-object v17

    if-eqz v17, :cond_4

    .line 1060
    const/16 v29, 0x5

    aget-object v23, v17, v29

    .line 1061
    const/16 v29, 0x4

    aget-object v9, v17, v29

    .line 1062
    const/16 v29, 0x2

    aget-object v25, v17, v29

    .line 1063
    const/16 v29, 0x1

    aget-object v22, v17, v29

    .line 1064
    const/16 v29, 0x0

    aget-object v26, v17, v29

    goto/16 :goto_1

    .line 1073
    :cond_b
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->isSubscribed()Z

    move-result v29

    if-nez v29, :cond_d

    .line 1075
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v29

    move-object/from16 v0, p0

    move-object/from16 v1, v29

    invoke-direct {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->subscribeToService(Lorg/cybergarage/upnp/Device;)Z

    move-result v29

    if-nez v29, :cond_c

    .line 1076
    const-string v29, "WeMoSDK"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "WeMoSDKContext : subscription failed "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1077
    const/16 v29, 0x0

    goto/16 :goto_2

    .line 1080
    :cond_c
    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setSubscribed(Z)V

    .line 1082
    :cond_d
    const-string v29, "WeMoSDK"

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "WeMoSDKContext : update "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " friendlyName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " binaryState: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " macAddress: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " firmwareVersion "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " hwVersion: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " hash: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual {v15}, Ljava/lang/Object;->hashCode()I

    move-result v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v30

    const-string v31, " brandName: "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    move-object/from16 v0, v30

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 1084
    const/16 v29, 0x1

    move-object/from16 v0, p1

    move/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAvailability(Z)V

    .line 1086
    move-object/from16 v0, p1

    invoke-virtual {v0, v9}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 1088
    move-object/from16 v0, v23

    invoke-virtual {v15, v0}, Lorg/cybergarage/upnp/Device;->setFriendlyName(Ljava/lang/String;)V

    .line 1089
    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setCustomizedState(Ljava/lang/String;)V

    .line 1090
    move-object/from16 v0, p1

    invoke-virtual {v0, v10}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setBrandName(Ljava/lang/String;)V

    .line 1091
    move-object/from16 v0, p1

    invoke-virtual {v0, v12}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setCountdownEndTime(Ljava/lang/String;)V

    .line 1092
    move-object/from16 v0, p1

    move-object/from16 v1, v26

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setMacAddress(Ljava/lang/String;)V

    .line 1093
    move-object/from16 v0, p1

    move-object/from16 v1, v27

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setProductName(Ljava/lang/String;)V

    .line 1094
    move-object/from16 v0, p1

    move-object/from16 v1, v22

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setFirmwareVersion(Ljava/lang/String;)V

    .line 1096
    move-object/from16 v0, p1

    move-object/from16 v1, v24

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setHwVersion(Ljava/lang/String;)V

    .line 1097
    invoke-virtual {v15, v11}, Lorg/cybergarage/upnp/Device;->setConfigureState(Ljava/lang/String;)V

    .line 1098
    const/4 v6, 0x0

    .line 1099
    .local v6, "attributeList":Lorg/json/JSONObject;
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v18

    .line 1100
    .local v18, "deviceType":Ljava/lang/String;
    const-string v29, "Maker"

    move-object/from16 v0, v18

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v29

    if-nez v29, :cond_e

    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isSmart(Ljava/lang/String;)Z

    move-result v29

    if-eqz v29, :cond_10

    .line 1102
    :cond_e
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getAttribute()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    move-result-object v16

    .line 1104
    .local v16, "deviceAttributeList":Ljava/lang/String;
    :try_start_1
    const-string v29, ""

    move-object/from16 v0, v16

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_f

    const-string v29, "null"

    move-object/from16 v0, v16

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-nez v29, :cond_f

    const/16 v29, 0x0

    move-object/from16 v0, v16

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_11

    .line 1105
    :cond_f
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getAttriuteListFromDevice()Lorg/json/JSONObject;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    move-result-object v6

    .line 1114
    :goto_3
    :try_start_2
    move-object/from16 v0, p0

    move-object/from16 v1, v18

    invoke-direct {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isSmart(Ljava/lang/String;)Z

    move-result v29

    if-nez v29, :cond_12

    .line 1115
    invoke-virtual {v15}, Lorg/cybergarage/upnp/Device;->getAttributetParameterFromDevice()Lorg/json/JSONObject;

    move-result-object v8

    .line 1116
    .local v8, "attributes":Lorg/json/JSONObject;
    invoke-virtual {v15, v6, v8}, Lorg/cybergarage/upnp/Device;->updateAttributesList(Lorg/json/JSONObject;Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object v28

    .line 1121
    .end local v8    # "attributes":Lorg/json/JSONObject;
    .local v28, "updateAttributeList":Lorg/json/JSONObject;
    :goto_4
    if-eqz v28, :cond_10

    .line 1122
    invoke-virtual/range {v28 .. v28}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p1

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAttribute(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 1125
    .end local v16    # "deviceAttributeList":Ljava/lang/String;
    .end local v28    # "updateAttributeList":Lorg/json/JSONObject;
    :cond_10
    const/16 v21, 0x0

    .line 1127
    .local v21, "file":Ljava/io/File;
    :try_start_3
    const-string v29, "0"

    move-object/from16 v0, v25

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v29

    if-eqz v29, :cond_13

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v29

    const-string v30, "uuid:Maker"

    invoke-virtual/range {v29 .. v30}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v29

    if-eqz v29, :cond_13

    .line 1128
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->context:Landroid/content/Context;

    move-object/from16 v29, v0

    invoke-static/range {v29 .. v29}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v29

    new-instance v30, Ljava/net/URL;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v25

    move-object/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/storage/FileStorage;->storeDefaultIcon(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    move-result-object v21

    .line 1139
    :goto_5
    if-nez v21, :cond_14

    :try_start_4
    const-string v29, ""

    :goto_6
    move-object/from16 v0, p1

    move-object/from16 v1, v29

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setLogo(Ljava/lang/String;)V

    .line 1142
    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v29

    move-object/from16 v0, p0

    move-object/from16 v1, v22

    move-object/from16 v2, v29

    invoke-direct {v0, v15, v1, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->checkIfServiceFilesReload(Lorg/cybergarage/upnp/Device;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    .line 1143
    const/16 v29, 0x1

    goto/16 :goto_2

    .line 1108
    .end local v21    # "file":Ljava/io/File;
    .restart local v16    # "deviceAttributeList":Ljava/lang/String;
    :cond_11
    :try_start_5
    new-instance v7, Lorg/json/JSONObject;

    move-object/from16 v0, v16

    invoke-direct {v7, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .end local v6    # "attributeList":Lorg/json/JSONObject;
    .local v7, "attributeList":Lorg/json/JSONObject;
    move-object v6, v7

    .end local v7    # "attributeList":Lorg/json/JSONObject;
    .restart local v6    # "attributeList":Lorg/json/JSONObject;
    goto :goto_3

    .line 1110
    :catch_0
    move-exception v20

    .line 1111
    .local v20, "ex":Ljava/lang/Exception;
    :try_start_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    move-object/from16 v29, v0

    new-instance v30, Ljava/lang/StringBuilder;

    invoke-direct/range {v30 .. v30}, Ljava/lang/StringBuilder;-><init>()V

    const-string v31, "Exception in attribute list "

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v20 .. v20}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v31

    invoke-virtual/range {v30 .. v31}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v30

    invoke-virtual/range {v30 .. v30}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v30

    invoke-static/range {v29 .. v30}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    goto/16 :goto_3

    .line 1144
    .end local v4    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .end local v5    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .end local v6    # "attributeList":Lorg/json/JSONObject;
    .end local v9    # "binaryState":Ljava/lang/String;
    .end local v10    # "brandName":Ljava/lang/String;
    .end local v11    # "configureState":Ljava/lang/String;
    .end local v12    # "countDownEndTime":Ljava/lang/String;
    .end local v13    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v14    # "customizedState":Ljava/lang/String;
    .end local v15    # "device":Lorg/cybergarage/upnp/Device;
    .end local v16    # "deviceAttributeList":Ljava/lang/String;
    .end local v17    # "deviceInformation":[Ljava/lang/String;
    .end local v18    # "deviceType":Ljava/lang/String;
    .end local v20    # "ex":Ljava/lang/Exception;
    .end local v22    # "firmwareVersion":Ljava/lang/String;
    .end local v23    # "friendlyName":Ljava/lang/String;
    .end local v24    # "hwVersion":Ljava/lang/String;
    .end local v25    # "iconVersion":Ljava/lang/String;
    .end local v26    # "macAddress":Ljava/lang/String;
    .end local v27    # "productName":Ljava/lang/String;
    :catch_1
    move-exception v19

    .line 1146
    .local v19, "e":Ljava/lang/Exception;
    invoke-virtual/range {v19 .. v19}, Ljava/lang/Exception;->printStackTrace()V

    .line 1148
    const/16 v29, 0x0

    goto/16 :goto_2

    .line 1118
    .end local v19    # "e":Ljava/lang/Exception;
    .restart local v4    # "actionGetDeviceInformation":Lorg/cybergarage/upnp/Action;
    .restart local v5    # "actionGetInformation":Lorg/cybergarage/upnp/Action;
    .restart local v6    # "attributeList":Lorg/json/JSONObject;
    .restart local v9    # "binaryState":Ljava/lang/String;
    .restart local v10    # "brandName":Ljava/lang/String;
    .restart local v11    # "configureState":Ljava/lang/String;
    .restart local v12    # "countDownEndTime":Ljava/lang/String;
    .restart local v13    # "customizedInformation":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v14    # "customizedState":Ljava/lang/String;
    .restart local v15    # "device":Lorg/cybergarage/upnp/Device;
    .restart local v16    # "deviceAttributeList":Ljava/lang/String;
    .restart local v17    # "deviceInformation":[Ljava/lang/String;
    .restart local v18    # "deviceType":Ljava/lang/String;
    .restart local v22    # "firmwareVersion":Ljava/lang/String;
    .restart local v23    # "friendlyName":Ljava/lang/String;
    .restart local v24    # "hwVersion":Ljava/lang/String;
    .restart local v25    # "iconVersion":Ljava/lang/String;
    .restart local v26    # "macAddress":Ljava/lang/String;
    .restart local v27    # "productName":Ljava/lang/String;
    :cond_12
    move-object/from16 v28, v6

    .restart local v28    # "updateAttributeList":Lorg/json/JSONObject;
    goto/16 :goto_4

    .line 1132
    .end local v16    # "deviceAttributeList":Ljava/lang/String;
    .end local v28    # "updateAttributeList":Lorg/json/JSONObject;
    .restart local v21    # "file":Ljava/io/File;
    :cond_13
    const/16 v29, 0x0

    :try_start_7
    invoke-static/range {v29 .. v29}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v29

    new-instance v30, Ljava/net/URL;

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v31

    invoke-direct/range {v30 .. v31}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p1 .. p1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getSerialNumber()Ljava/lang/String;

    move-result-object v31

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v25

    move-object/from16 v3, v31

    invoke-virtual {v0, v1, v2, v3}, Lcom/belkin/wemo/storage/FileStorage;->getIconFile(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/io/File;
    :try_end_7
    .catch Ljava/net/MalformedURLException; {:try_start_7 .. :try_end_7} :catch_2
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    move-result-object v21

    goto :goto_5

    .line 1136
    :catch_2
    move-exception v19

    .line 1137
    .local v19, "e":Ljava/net/MalformedURLException;
    :try_start_8
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v29

    invoke-virtual/range {v29 .. v29}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v29

    const-string v30, "Incorrect logo url "

    move-object/from16 v0, v29

    move-object/from16 v1, v30

    move-object/from16 v2, v19

    invoke-static {v0, v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto/16 :goto_5

    .line 1139
    .end local v19    # "e":Ljava/net/MalformedURLException;
    :cond_14
    invoke-virtual/range {v21 .. v21}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    move-result-object v29

    goto/16 :goto_6
.end method


# virtual methods
.method public addNotificationListener(Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;

    .prologue
    .line 155
    if-eqz p1, :cond_0

    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 158
    :cond_0
    return-void
.end method

.method public deviceAdded(Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 941
    return-void
.end method

.method public deviceRemoved(Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 972
    return-void
.end method

.method public eventNotifyReceived(Ljava/lang/String;Ljava/lang/String;JLjava/lang/String;Ljava/lang/String;)V
    .locals 5
    .param p1, "sid"    # Ljava/lang/String;
    .param p2, "LedDeviceId"    # Ljava/lang/String;
    .param p3, "seq"    # J
    .param p5, "name"    # Ljava/lang/String;
    .param p6, "state"    # Ljava/lang/String;

    .prologue
    .line 769
    invoke-direct {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceBySID(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v1

    .line 773
    .local v1, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v1, :cond_2

    if-eqz p5, :cond_2

    const-string v2, "BinaryState"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "StatusChange"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "ParamString"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "time"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "mode"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "cookedTime"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 781
    :cond_0
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Notification Type:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":::Notification Value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 782
    invoke-virtual {v1, p6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 783
    invoke-virtual {v1, p5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setNotifyType(Ljava/lang/String;)V

    .line 784
    const-string v2, "change_state"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 829
    :cond_1
    :goto_0
    return-void

    .line 787
    :cond_2
    if-eqz v1, :cond_3

    if-eqz p5, :cond_3

    const-string v2, "SensorChange"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 788
    invoke-virtual {v1, p6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 789
    invoke-virtual {v1, p5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setNotifyType(Ljava/lang/String;)V

    .line 790
    const-string v2, "SensorChange"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 792
    :cond_3
    if-eqz v1, :cond_4

    if-eqz p5, :cond_4

    const-string v2, "CountdownEndTime"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    .line 794
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Notification Type:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":::Notification Value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 795
    invoke-virtual {v1, p6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setCountdownEndTime(Ljava/lang/String;)V

    .line 796
    const-string v2, "CountdownEndTime"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 798
    :cond_4
    if-eqz v1, :cond_5

    if-eqz p5, :cond_5

    const-string v2, "FirmwareUpdateStatus"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 800
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Notification Type:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":::Notification Value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 801
    invoke-virtual {v1, p6}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setState(Ljava/lang/String;)V

    .line 802
    invoke-virtual {v1, p5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setNotifyType(Ljava/lang/String;)V

    .line 803
    const-string v2, "update_firmware"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 804
    :cond_5
    if-eqz v1, :cond_8

    if-eqz p5, :cond_8

    const-string v2, "attributeList"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_8

    .line 806
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Notification Type:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":::Notification Value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 807
    invoke-direct {p0, p6, v1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->updateAttributeList(Ljava/lang/String;Lcom/belkin/wemo/localsdk/WeMoDevice;)Ljava/lang/String;

    move-result-object v0

    .line 808
    .local v0, "updatedAttributeList":Ljava/lang/String;
    const-string v2, "null"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    const-string v2, ""

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 810
    :cond_6
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setAttribute(Ljava/lang/String;)V

    .line 811
    iget-boolean v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    if-eqz v2, :cond_7

    .line 813
    const-string v2, "change_attribute"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 816
    :cond_7
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isNotificationComes:Z

    goto/16 :goto_0

    .line 817
    .end local v0    # "updatedAttributeList":Ljava/lang/String;
    :cond_8
    if-eqz v1, :cond_9

    if-eqz p5, :cond_9

    const-string v2, "SubDeviceFWUpdate"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_9

    .line 819
    const-string v2, "SubDeviceFWUpdate"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 821
    :cond_9
    if-eqz v1, :cond_1

    if-eqz p5, :cond_1

    const-string v2, "TimeSyncRequest"

    invoke-virtual {p5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 824
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, " Notification Type:: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, ":::Notification Value "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 825
    invoke-virtual {v1, p5}, Lcom/belkin/wemo/localsdk/WeMoDevice;->setNotifyType(Ljava/lang/String;)V

    .line 826
    const-string v2, "TimeSync"

    invoke-virtual {v1}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v2, p2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0
.end method

.method public getActiveDeviceList()Ljava/util/ArrayList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/belkin/wemo/localsdk/WeMoDevice;",
            ">;"
        }
    .end annotation

    .prologue
    .line 1250
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mActiveDeviceList:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getDeviceCache()Ljava/lang/String;
    .locals 1

    .prologue
    .line 364
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/belkin/wemo/storage/FileStorage;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/storage/FileStorage;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/storage/FileStorage;->getDeviceCache()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getDeviceState(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 404
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v0

    .line 406
    .local v0, "wemoDevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-nez v0, :cond_0

    const-string v1, "-1"

    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getState()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getUpnpControl()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-nez v0, :cond_0

    .line 232
    new-instance v0, Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {v0}, Lorg/cybergarage/upnp/ControlPoint;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method public getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;
    .locals 1
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 736
    invoke-static {p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getFilteredUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 737
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->performActionWithCache(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/localsdk/WeMoDevice;

    return-object v0
.end method

.method public getWeMoDeviceCount()I
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceList()Lorg/cybergarage/upnp/DeviceList;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/DeviceList;->size()I

    move-result v0

    return v0
.end method

.method public declared-synchronized recreateControlPoint()Z
    .locals 5

    .prologue
    .line 1397
    monitor-enter p0

    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->context:Landroid/content/Context;

    invoke-direct {p0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getSSID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    .line 1398
    .local v1, "ssid":Ljava/lang/String;
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1400
    const-string v2, "WeMoSDK"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WemoSDKContext recreateControlPoint - returning as no need lastSSID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ssid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1401
    const/4 v2, 0x0

    .line 1420
    .end local v1    # "ssid":Ljava/lang/String;
    :goto_0
    monitor-exit p0

    return v2

    .line 1403
    .restart local v1    # "ssid":Ljava/lang/String;
    :cond_0
    :try_start_1
    const-string v2, "WeMoSDK"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "WemoSDKContext recreateControlPoint - new control point lastSSID: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " ssid: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 1406
    :try_start_2
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v2}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 1407
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    if-eqz v2, :cond_1

    .line 1408
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mControlPoint:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ControlPoint;->forceClose()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 1411
    :cond_1
    :goto_1
    const-wide/16 v2, 0x7d0

    :try_start_3
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V

    .line 1412
    iget-object v2, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->context:Landroid/content/Context;

    invoke-direct {p0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->initControlPoint(Landroid/content/Context;)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1416
    .end local v1    # "ssid":Ljava/lang/String;
    :goto_2
    const-wide/16 v2, 0x7d0

    :try_start_4
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 1420
    :goto_3
    const/4 v2, 0x1

    goto :goto_0

    .line 1414
    :catch_0
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_2

    .line 1397
    .end local v0    # "e":Ljava/lang/Exception;
    :catchall_0
    move-exception v2

    monitor-exit p0

    throw v2

    .line 1417
    :catch_1
    move-exception v0

    .line 1418
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_6
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_3

    .line 1410
    .end local v0    # "e":Ljava/lang/InterruptedException;
    .restart local v1    # "ssid":Ljava/lang/String;
    :catch_2
    move-exception v2

    goto :goto_1
.end method

.method public refreshListOfWeMoDevicesOnLAN()V
    .locals 2

    .prologue
    .line 249
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->TAG:Ljava/lang/String;

    const-string v1, "TO BE REMOVED WHEN WeMoSDKContext is removed - Call to refreshListOfWeMoDevicesOnLAN ommitted"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    return-void
.end method

.method public removeNotificationListener(Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/localsdk/WeMoSDKContext$NotificationListener;

    .prologue
    .line 166
    if-eqz p1, :cond_0

    .line 167
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mListeners:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 169
    :cond_0
    return-void
.end method

.method public removeWeMoDeviceByUDN(Ljava/lang/String;)Z
    .locals 2
    .param p1, "udn"    # Ljava/lang/String;

    .prologue
    .line 748
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v0

    .line 750
    .local v0, "device":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v0, :cond_0

    .line 751
    const/4 v1, 0x4

    invoke-direct {p0, v1, v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->performActionWithCache(ILjava/lang/Object;)Ljava/lang/Object;

    .line 752
    const/4 v1, 0x1

    .line 754
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public setAttriuteState(Ljava/lang/String;Lorg/json/JSONObject;)V
    .locals 9
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "attributeList"    # Lorg/json/JSONObject;

    .prologue
    const/4 v8, 0x3

    const/4 v7, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 466
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v2

    .line 467
    .local v2, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v2, :cond_0

    .line 468
    const/4 v0, 0x0

    .line 469
    .local v0, "argumet":[Ljava/lang/String;
    invoke-virtual {v2}, Lcom/belkin/wemo/localsdk/WeMoDevice;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v3

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getDeviceType()Ljava/lang/String;

    move-result-object v3

    invoke-direct {p0, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->isSmart(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 470
    new-array v0, v6, [Ljava/lang/String;

    .end local v0    # "argumet":[Ljava/lang/String;
    invoke-direct {p0, p2, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->createAttributeList(Lorg/json/JSONObject;Lcom/belkin/wemo/localsdk/WeMoDevice;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    .line 478
    .restart local v0    # "argumet":[Ljava/lang/String;
    :goto_0
    new-instance v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V

    .line 479
    .local v1, "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0xb

    if-lt v3, v4, :cond_2

    .line 480
    sget-object v3, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v4, v8, [Ljava/lang/Object;

    aput-object v0, v4, v5

    aput-object v2, v4, v6

    aput-object p2, v4, v7

    invoke-virtual {v1, v3, v4}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 485
    .end local v0    # "argumet":[Ljava/lang/String;
    .end local v1    # "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;
    :cond_0
    :goto_1
    return-void

    .line 474
    .restart local v0    # "argumet":[Ljava/lang/String;
    :cond_1
    new-array v0, v6, [Ljava/lang/String;

    .end local v0    # "argumet":[Ljava/lang/String;
    invoke-direct {p0, p2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->createAttributeList(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v0, v5

    .restart local v0    # "argumet":[Ljava/lang/String;
    goto :goto_0

    .line 482
    .restart local v1    # "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;
    :cond_2
    new-array v3, v8, [Ljava/lang/Object;

    aput-object v0, v3, v5

    aput-object v2, v3, v6

    aput-object p2, v3, v7

    invoke-virtual {v1, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceAttributeSetter;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_1
.end method

.method public setBlobStorage(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "udn"    # Ljava/lang/String;
    .param p2, "sensortype"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 637
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v1

    .line 640
    .local v1, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v1, :cond_0

    .line 641
    new-instance v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V

    .line 643
    .local v0, "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    .line 644
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object v1, v3, v4

    aput-object p2, v3, v5

    invoke-virtual {v0, v2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 649
    .end local v0    # "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;
    :cond_0
    :goto_0
    return-void

    .line 646
    .restart local v0    # "deviceAttriuteSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;
    :cond_1
    new-array v2, v6, [Ljava/lang/Object;

    aput-object v1, v2, v4

    aput-object p2, v2, v5

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceBlobStorageTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public setDeviceState(Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "state"    # Ljava/lang/String;
    .param p2, "udn"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 418
    invoke-virtual {p0, p2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->getWeMoDeviceByUDN(Ljava/lang/String;)Lcom/belkin/wemo/localsdk/WeMoDevice;

    move-result-object v1

    .line 420
    .local v1, "wemodevice":Lcom/belkin/wemo/localsdk/WeMoDevice;
    if-eqz v1, :cond_0

    .line 421
    new-instance v0, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;

    const/4 v2, 0x0

    invoke-direct {v0, p0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;)V

    .line 423
    .local v0, "deviceStateSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0xb

    if-lt v2, v3, :cond_1

    .line 424
    sget-object v2, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v3, v6, [Ljava/lang/Object;

    aput-object p1, v3, v4

    aput-object v1, v3, v5

    invoke-virtual {v0, v2, v3}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 429
    .end local v0    # "deviceStateSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;
    :cond_0
    :goto_0
    return-void

    .line 426
    .restart local v0    # "deviceStateSetter":Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;
    :cond_1
    new-array v2, v6, [Ljava/lang/Object;

    aput-object p1, v2, v4

    aput-object v1, v2, v5

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$DeviceStateSetter;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 207
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->lastSSID:Ljava/lang/String;

    .line 208
    invoke-direct {p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->saveDeviceCache()V

    .line 209
    iget-object v0, p0, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->mDeviceCache:Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-virtual {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;->clear()V

    .line 210
    invoke-direct {p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->stopListen()V

    .line 212
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;

    invoke-direct {v1, p0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext$1;-><init>(Lcom/belkin/wemo/localsdk/WeMoSDKContext;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 224
    return-void
.end method
