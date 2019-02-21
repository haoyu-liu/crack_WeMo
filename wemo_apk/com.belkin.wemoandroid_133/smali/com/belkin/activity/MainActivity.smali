.class public Lcom/belkin/activity/MainActivity;
.super Lorg/apache/cordova/CordovaActivity;
.source "MainActivity.java"

# interfaces
.implements Lcom/belkin/controller/listener/PhotoRequestedListener;
.implements Lcom/belkin/wemo/PermissionListners;


# static fields
.field public static final REQUEST_CODE_CAPTURE_PHOTO:I = 0x65

.field public static final REQUEST_CODE_IMAGE_CROP:I = 0x66

.field public static final REQUEST_CODE_SELECT_PHOTO:I = 0x64

.field private static final TAG:Ljava/lang/String;

.field public static mProgressDialog:Landroid/app/Dialog;

.field public static mRuleProgressDialog:Landroid/app/ProgressDialog;


# instance fields
.field private broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

.field private cameraImageLocationUri:Landroid/net/Uri;

.field private cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

.field private isAppFromBackground:Z

.field private isPhotoRequested:Z

.field private mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

.field private mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

.field private mpermissionController:Lcom/belkin/wemo/PermissionController;

.field private permListner:Lcom/belkin/wemo/PermListner;

.field private remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

.field private selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

.field private takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 52
    const-class v0, Lcom/belkin/activity/MainActivity;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 50
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    .line 66
    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 67
    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .line 68
    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 77
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/activity/MainActivity;->isAppFromBackground:Z

    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$100(Lcom/belkin/activity/MainActivity;)Lcom/belkin/wemo/PermListner;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/activity/MainActivity;

    .prologue
    .line 50
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->permListner:Lcom/belkin/wemo/PermListner;

    return-object v0
.end method

.method private checkIfAppUpgraded()V
    .locals 9

    .prologue
    .line 497
    :try_start_0
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v6

    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x0

    invoke-virtual {v6, v7, v8}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v3

    .line 498
    .local v3, "pkgInfo":Landroid/content/pm/PackageInfo;
    iget v1, v3, Landroid/content/pm/PackageInfo;->versionCode:I

    .line 500
    .local v1, "currentAppVersionCode":I
    new-instance v5, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v5, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 501
    .local v5, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v5}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getAppVersionCode()Ljava/lang/String;

    move-result-object v0

    .line 502
    .local v0, "appVersionCode":Ljava/lang/String;
    const/4 v4, 0x0

    .line 503
    .local v4, "previousAppVersionCode":I
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v6

    if-lez v6, :cond_0

    .line 504
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v4

    .line 507
    :cond_0
    sget-object v6, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "currentAppVersionCode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    sget-object v6, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "previousAppVersionCode: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 511
    const/16 v6, 0x3c

    if-le v4, v6, :cond_1

    if-le v1, v4, :cond_1

    .line 512
    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setAppVersionCode(Ljava/lang/String;)V

    .line 513
    invoke-static {p0}, Lcom/belkin/utils/RateMe;->reset(Landroid/content/Context;)V

    .line 514
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 519
    .end local v0    # "appVersionCode":Ljava/lang/String;
    .end local v1    # "currentAppVersionCode":I
    .end local v3    # "pkgInfo":Landroid/content/pm/PackageInfo;
    .end local v4    # "previousAppVersionCode":I
    .end local v5    # "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :cond_1
    :goto_0
    return-void

    .line 516
    :catch_0
    move-exception v2

    .line 517
    .local v2, "e":Ljava/lang/Exception;
    sget-object v6, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v7, "Exception"

    invoke-static {v6, v7, v2}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private initDevManager()V
    .locals 2

    .prologue
    .line 438
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "initDevManager()"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 439
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-nez v0, :cond_0

    .line 440
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 441
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->disableCacheStat(Z)V

    .line 443
    :cond_0
    return-void
.end method

.method private logApplicationStartMode()V
    .locals 2

    .prologue
    .line 424
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    if-nez v0, :cond_0

    .line 425
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 427
    :cond_0
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Home"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 428
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "ApplicationStart-StartHome"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 432
    :cond_1
    :goto_0
    return-void

    .line 429
    :cond_2
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Remote_WiFi"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 430
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "ApplicationStart-StartRemote_WiFi"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private registerNetworkChangeBroadcastReceiver()V
    .locals 3

    .prologue
    .line 446
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-nez v0, :cond_0

    .line 447
    new-instance v0, Lcom/belkin/activity/MainActivity$2;

    invoke-direct {v0, p0}, Lcom/belkin/activity/MainActivity$2;-><init>(Lcom/belkin/activity/MainActivity;)V

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 478
    :cond_0
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    new-instance v1, Landroid/content/IntentFilter;

    const-string v2, "com.wemo.belkin.NETWORK_SWICTHED"

    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Lcom/belkin/activity/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 480
    return-void
.end method

.method private registerPushNotificationDialogReceiver()V
    .locals 2

    .prologue
    .line 405
    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    if-nez v1, :cond_0

    .line 406
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 407
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string v1, "com.belkin.wemo.intent.ACTION_DISPLAY_PUSH_MESSAGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 409
    new-instance v1, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    invoke-direct {v1}, Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;-><init>()V

    iput-object v1, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    .line 411
    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    invoke-virtual {p0, v1, v0}, Lcom/belkin/activity/MainActivity;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 413
    .end local v0    # "filter":Landroid/content/IntentFilter;
    :cond_0
    return-void
.end method

.method private registerRemoteEnabledEventsReceiver()V
    .locals 2

    .prologue
    .line 156
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    if-nez v0, :cond_0

    .line 157
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "Registering for REMOTE_ENABLE events via OnRemoteEnabledBroadcastReceiver"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    new-instance v0, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    .line 160
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    .line 162
    :cond_0
    return-void
.end method

.method private unregisterNetworkChangeBroadcastReceiver()V
    .locals 1

    .prologue
    .line 483
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    if-eqz v0, :cond_0

    .line 484
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/belkin/activity/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 485
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->mNetworkChangeBroadcastReceiver:Landroid/content/BroadcastReceiver;

    .line 487
    :cond_0
    return-void
.end method

.method private unregisterPushNotificationDialogReceiver()V
    .locals 1

    .prologue
    .line 416
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    if-eqz v0, :cond_0

    .line 417
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    invoke-virtual {p0, v0}, Lcom/belkin/activity/MainActivity;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 418
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->broadcastReceiver:Lcom/belkin/wemo/push/broadcastreceiver/PushMessageDialogBroadcastReceiver;

    .line 420
    :cond_0
    return-void
.end method

.method private unregisterRemoteEnabledEventsReceiver()V
    .locals 2

    .prologue
    .line 165
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    if-eqz v0, :cond_0

    .line 166
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "un-registering any broadcastreceiver for REMOTE_ENABLE events via OnRemoteEnabledBroadcastReceiver"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    invoke-static {}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    move-result-object v0

    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->removeRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z

    .line 169
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/activity/MainActivity;->remoteAccessListener:Lcom/belkin/wemo/broadcastreceiver/PushNotificationOnRemoteAccessListener;

    .line 171
    :cond_0
    return-void
.end method


# virtual methods
.method public locationPermissionCheck()Z
    .locals 4

    .prologue
    .line 529
    const/4 v1, 0x0

    .line 531
    .local v1, "perm":Z
    :try_start_0
    iget-object v3, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    invoke-virtual {v3}, Lcom/belkin/wemo/PermissionController;->canAccessLocation()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 532
    const/4 v1, 0x1

    move v2, v1

    .line 543
    .end local v1    # "perm":Z
    .local v2, "perm":I
    :goto_0
    return v2

    .line 535
    .end local v2    # "perm":I
    .restart local v1    # "perm":Z
    :cond_0
    iget-object v3, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    invoke-virtual {v3}, Lcom/belkin/wemo/PermissionController;->askLocPermission()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 536
    const/4 v1, 0x0

    move v2, v1

    .line 537
    .restart local v2    # "perm":I
    goto :goto_0

    .line 539
    .end local v2    # "perm":I
    :catch_0
    move-exception v0

    .line 540
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    move v2, v1

    .line 543
    .restart local v2    # "perm":I
    goto :goto_0
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 6
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v5, 0x0

    const/4 v4, 0x1

    const/4 v3, -0x1

    .line 294
    invoke-super {p0, p1, p2, p3}, Lorg/apache/cordova/CordovaActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 296
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EDIT ICON: Activity Lifecycle: onActivityResult. Request Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Result Code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Camera  Image Location URI: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/activity/MainActivity;->cameraImageLocationUri:Landroid/net/Uri;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 297
    const/16 v0, 0x65

    if-ne p1, v0, :cond_2

    .line 298
    iput-boolean v4, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    .line 299
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;

    if-eqz v0, :cond_0

    .line 300
    if-ne p2, v3, :cond_1

    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->cameraImageLocationUri:Landroid/net/Uri;

    if-eqz v0, :cond_1

    .line 301
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;

    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->cameraImageLocationUri:Landroid/net/Uri;

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/TakePictureListener;->onPictureTaken(Landroid/net/Uri;)V

    .line 305
    :goto_0
    iput-object v5, p0, Lcom/belkin/activity/MainActivity;->takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;

    .line 332
    :cond_0
    :goto_1
    return-void

    .line 303
    :cond_1
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;

    const-string v1, "EDIT ICON: Activity result from camera was not ok."

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/TakePictureListener;->onTakePictureError(Ljava/lang/String;)V

    goto :goto_0

    .line 307
    :cond_2
    const/16 v0, 0x64

    if-ne p1, v0, :cond_5

    .line 308
    iput-boolean v4, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    .line 309
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    if-eqz v0, :cond_0

    .line 310
    if-ne p2, v3, :cond_4

    .line 311
    if-eqz p3, :cond_3

    .line 312
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/SelectPhotoListener;->onPhotoSelected(Landroid/net/Uri;)V

    .line 319
    :goto_2
    iput-object v5, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    goto :goto_1

    .line 314
    :cond_3
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    const-string v1, "EDIT ICON: Intent from gallery didn\'t contain image uri."

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/SelectPhotoListener;->onPhotoSelectionError(Ljava/lang/String;)V

    goto :goto_2

    .line 317
    :cond_4
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    const-string v1, "EDIT ICON: Activity result from gallery was not ok."

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/SelectPhotoListener;->onPhotoSelectionError(Ljava/lang/String;)V

    goto :goto_2

    .line 321
    :cond_5
    const/16 v0, 0x66

    if-ne p1, v0, :cond_0

    .line 322
    iput-boolean v4, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    .line 323
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

    if-eqz v0, :cond_0

    .line 324
    if-ne p2, v3, :cond_6

    .line 325
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

    invoke-static {p3}, Lcom/soundcloud/android/crop/Crop;->getOutput(Landroid/content/Intent;)Landroid/net/Uri;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/CropImageByUserCallback;->onImageCropped(Landroid/net/Uri;)V

    .line 329
    :goto_3
    iput-object v5, p0, Lcom/belkin/activity/MainActivity;->cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

    goto :goto_1

    .line 327
    :cond_6
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "EDIT ICON: Activity result from crop was NOT OK. Result code: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/controller/listener/CropImageByUserCallback;->onCropError(Ljava/lang/String;)V

    goto :goto_3
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 2
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 523
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "Activity Lifecycle: onConfigurationChanged()"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 524
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 525
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 8
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v7, 0x0

    .line 82
    sget-object v4, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v5, "Activity Lifecycle: onCreate"

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 85
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->initDevManager()V

    .line 86
    new-instance v4, Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-direct {v4, p0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .line 87
    invoke-static {p0}, Lcom/belkin/controller/WidgetController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/WidgetController;

    .line 88
    invoke-static {p0}, Lcom/belkin/wemo/PermissionController;->getInstance(Landroid/app/Activity;)Lcom/belkin/wemo/PermissionController;

    move-result-object v4

    iput-object v4, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    .line 92
    invoke-static {p0}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/belkin/controller/DeviceListController;->setPhotoRequestListener(Lcom/belkin/controller/listener/PhotoRequestedListener;)V

    .line 93
    invoke-static {p0}, Lcom/belkin/wemo/Permissions;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;

    move-result-object v4

    invoke-virtual {v4, p0}, Lcom/belkin/wemo/Permissions;->setLocationRequestListener(Lcom/belkin/wemo/PermissionListners;)V

    .line 95
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->registerNetworkChangeBroadcastReceiver()V

    .line 117
    iget-object v4, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    if-nez v4, :cond_0

    .line 118
    new-instance v4, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v4, p0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v4, p0, Lcom/belkin/activity/MainActivity;->mNetworkUtil:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 121
    :cond_0
    const/4 v3, 0x0

    .line 123
    .local v3, "url":Ljava/lang/String;
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    .line 124
    .local v1, "intent":Landroid/content/Intent;
    if-eqz v1, :cond_1

    .line 125
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string v5, "eventCode"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 126
    .local v0, "eventCode":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 127
    const-string v4, "overtempon"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 128
    const-string v4, "macAddress"

    invoke-virtual {v1, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 129
    .local v2, "mac":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 130
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "file:///android_asset/www/devices.html#page/wemo_devices/showOverTempWarning/mac="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 138
    .end local v0    # "eventCode":Ljava/lang/String;
    .end local v2    # "mac":Ljava/lang/String;
    :cond_1
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 139
    invoke-static {}, Lorg/apache/cordova/Config;->getStartUrl()Ljava/lang/String;

    move-result-object v3

    .line 146
    :cond_2
    sget-object v4, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "URL to load into WebView: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 147
    invoke-virtual {p0, v3}, Lcom/belkin/activity/MainActivity;->loadUrl(Ljava/lang/String;)V

    .line 148
    new-instance v4, Landroid/app/Dialog;

    invoke-direct {v4, p0}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    .line 149
    new-instance v4, Landroid/app/ProgressDialog;

    invoke-direct {v4, p0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    sput-object v4, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    .line 152
    invoke-static {}, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->getInstance()Lcom/belkin/wemo/push/IPushNotification;

    move-result-object v4

    invoke-interface {v4, p0, v7, v7}, Lcom/belkin/wemo/push/IPushNotification;->registerPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/RegisterPushSuccessCallback;)V

    .line 153
    return-void
.end method

.method public onCropImageByUser(Landroid/net/Uri;Lcom/belkin/controller/listener/CropImageByUserCallback;)V
    .locals 2
    .param p1, "icon"    # Landroid/net/Uri;
    .param p2, "callback"    # Lcom/belkin/controller/listener/CropImageByUserCallback;

    .prologue
    .line 399
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "EDIT ICON: onCropImageByUser"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    iput-object p2, p0, Lcom/belkin/activity/MainActivity;->cropImageByUserCallback:Lcom/belkin/controller/listener/CropImageByUserCallback;

    .line 401
    invoke-static {p1, p1}, Lcom/soundcloud/android/crop/Crop;->of(Landroid/net/Uri;Landroid/net/Uri;)Lcom/soundcloud/android/crop/Crop;

    move-result-object v0

    invoke-virtual {v0}, Lcom/soundcloud/android/crop/Crop;->asSquare()Lcom/soundcloud/android/crop/Crop;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, p0, v1}, Lcom/soundcloud/android/crop/Crop;->start(Landroid/app/Activity;I)V

    .line 402
    return-void
.end method

.method public onDestroy()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 192
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "Activity Lifecycle: onDestroy"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 194
    sget-object v0, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 195
    sget-object v0, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 196
    sput-object v2, Lcom/belkin/activity/MainActivity;->mProgressDialog:Landroid/app/Dialog;

    .line 198
    :cond_0
    sget-object v0, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    if-eqz v0, :cond_1

    .line 199
    sget-object v0, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 200
    sput-object v2, Lcom/belkin/activity/MainActivity;->mRuleProgressDialog:Landroid/app/ProgressDialog;

    .line 205
    :cond_1
    sget-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    if-eqz v0, :cond_2

    .line 206
    sget-object v0, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    invoke-virtual {v0}, Lcom/belkin/wemo/localsdk/WeMoSDKContext;->stop()V

    .line 207
    sput-object v2, Lcom/belkin/cordova/plugin/DevicePlugin;->mWeMoSDKContext:Lcom/belkin/wemo/localsdk/WeMoSDKContext;

    .line 210
    :cond_2
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    if-eqz v0, :cond_3

    .line 211
    sget-object v0, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stop()V

    .line 212
    sput-object v2, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->sDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 214
    :cond_3
    iput-object v2, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    .line 215
    iput-object v2, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 216
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/belkin/activity/MainActivity;->isAppFromBackground:Z

    .line 220
    invoke-static {p0}, Lcom/belkin/controller/DeviceListController;->getInstance(Landroid/content/Context;)Lcom/belkin/controller/DeviceListController;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/belkin/controller/DeviceListController;->setPhotoRequestListener(Lcom/belkin/controller/listener/PhotoRequestedListener;)V

    .line 221
    invoke-static {p0}, Lcom/belkin/wemo/Permissions;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/Permissions;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/belkin/wemo/Permissions;->setLocationRequestListener(Lcom/belkin/wemo/PermissionListners;)V

    .line 223
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->unregisterNetworkChangeBroadcastReceiver()V

    .line 226
    invoke-static {}, Lcom/belkin/wemo/push/impl/PushNotificationFactory;->getInstance()Lcom/belkin/wemo/push/IPushNotification;

    move-result-object v0

    invoke-interface {v0, p0, v2, v2}, Lcom/belkin/wemo/push/IPushNotification;->unregisterPushNotifications(Landroid/content/Context;Lcom/belkin/wemo/push/callback/PushNotificationErrorCallback;Lcom/belkin/wemo/push/callback/UnregisterPushSuccessCallback;)V

    .line 228
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onDestroy()V

    .line 229
    return-void
.end method

.method protected onNewIntent(Landroid/content/Intent;)V
    .locals 0
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    .line 288
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onNewIntent(Landroid/content/Intent;)V

    .line 289
    invoke-virtual {p0, p1}, Lcom/belkin/activity/MainActivity;->setIntent(Landroid/content/Intent;)V

    .line 290
    return-void
.end method

.method protected onPause()V
    .locals 3

    .prologue
    .line 233
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onPause()V

    .line 234
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Activity Lifecycle: onPause. isPhotoRequested: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 236
    iget-boolean v0, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    if-nez v0, :cond_0

    .line 237
    const/4 v0, 0x0

    invoke-static {v0}, Lcom/belkin/wemo/cache/utils/WemoUtils;->setAppForeground(Z)V

    .line 238
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-virtual {v0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onPauseDLM()V

    .line 240
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/activity/MainActivity;->isAppFromBackground:Z

    .line 241
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->unregisterPushNotificationDialogReceiver()V

    .line 244
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->unregisterRemoteEnabledEventsReceiver()V

    .line 245
    return-void
.end method

.method public onPermissionCheck(Lcom/belkin/wemo/PermListner;)V
    .locals 2
    .param p1, "listner"    # Lcom/belkin/wemo/PermListner;

    .prologue
    .line 548
    iput-object p1, p0, Lcom/belkin/activity/MainActivity;->permListner:Lcom/belkin/wemo/PermListner;

    .line 549
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    invoke-virtual {v0}, Lcom/belkin/wemo/PermissionController;->canAccessLocation()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 550
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->permListner:Lcom/belkin/wemo/PermListner;

    invoke-interface {v0}, Lcom/belkin/wemo/PermListner;->onPermGranted()V

    .line 565
    :goto_0
    return-void

    .line 552
    :cond_0
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    new-instance v1, Lcom/belkin/activity/MainActivity$3;

    invoke-direct {v1, p0}, Lcom/belkin/activity/MainActivity$3;-><init>(Lcom/belkin/activity/MainActivity;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/PermissionController;->askLocationPermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V

    goto :goto_0
.end method

.method public onRequestPermissionsResult(I[Ljava/lang/String;[I)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "permissions"    # [Ljava/lang/String;
    .param p3, "grantResults"    # [I

    .prologue
    .line 389
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    invoke-virtual {v0, p1, p2, p3}, Lcom/belkin/wemo/PermissionController;->onRequestPermissionsResult(I[Ljava/lang/String;[I)V

    .line 391
    return-void
.end method

.method protected onResume()V
    .locals 5

    .prologue
    .line 249
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onResume()V

    .line 250
    sget-object v2, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Activity Lifecycle: onResume. isPhotoRequested: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-boolean v4, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 252
    iget-boolean v2, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    if-nez v2, :cond_1

    .line 253
    const/4 v2, 0x1

    invoke-static {v2}, Lcom/belkin/wemo/cache/utils/WemoUtils;->setAppForeground(Z)V

    .line 254
    iget-object v2, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-virtual {v2}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onResumeDLM()V

    .line 257
    iget-boolean v2, p0, Lcom/belkin/activity/MainActivity;->isAppFromBackground:Z

    if-eqz v2, :cond_0

    .line 259
    iget-object v2, p0, Lcom/belkin/activity/MainActivity;->mDeviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-static {p0, v2}, Lcom/belkin/utils/RateMe;->handleRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    .line 268
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->registerPushNotificationDialogReceiver()V

    .line 270
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->logApplicationStartMode()V

    .line 274
    :try_start_0
    new-instance v2, Landroid/os/StrictMode$ThreadPolicy$Builder;

    invoke-direct {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;-><init>()V

    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->permitNetwork()Landroid/os/StrictMode$ThreadPolicy$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroid/os/StrictMode$ThreadPolicy$Builder;->build()Landroid/os/StrictMode$ThreadPolicy;

    move-result-object v1

    .line 275
    .local v1, "policy":Landroid/os/StrictMode$ThreadPolicy;
    invoke-static {v1}, Landroid/os/StrictMode;->setThreadPolicy(Landroid/os/StrictMode$ThreadPolicy;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 281
    .end local v1    # "policy":Landroid/os/StrictMode$ThreadPolicy;
    :goto_1
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->registerRemoteEnabledEventsReceiver()V

    .line 283
    sget-object v2, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v3, "Activity Lifecycle: onResume END"

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 284
    return-void

    .line 264
    :cond_1
    const/4 v2, 0x0

    iput-boolean v2, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    goto :goto_0

    .line 276
    :catch_0
    move-exception v0

    .line 277
    .local v0, "e":Ljava/lang/Exception;
    sget-object v2, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Error setting thread policy :"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method

.method public onSelectPhoto(Lcom/belkin/controller/listener/SelectPhotoListener;)V
    .locals 2
    .param p1, "listener"    # Lcom/belkin/controller/listener/SelectPhotoListener;

    .prologue
    .line 340
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.GET_CONTENT"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 341
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "image/*"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setType(Ljava/lang/String;)Landroid/content/Intent;

    .line 342
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 343
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    .line 344
    iput-object p1, p0, Lcom/belkin/activity/MainActivity;->selectPhotoListener:Lcom/belkin/controller/listener/SelectPhotoListener;

    .line 345
    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/belkin/activity/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 351
    :goto_0
    return-void

    .line 349
    :cond_0
    const-string v1, "No activity available to respond to ACTION_GET_CONTENT intent."

    invoke-interface {p1, v1}, Lcom/belkin/controller/listener/SelectPhotoListener;->onPhotoSelectionError(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected onStart()V
    .locals 2

    .prologue
    .line 176
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onStart()V

    .line 177
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "Activity Lifecycle: onStart"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 178
    iget-object v0, p0, Lcom/belkin/activity/MainActivity;->mSmartDevicePlugin:Lcom/belkin/cordova/plugin/SmartDevicePlugin;

    invoke-virtual {v0}, Lcom/belkin/cordova/plugin/SmartDevicePlugin;->onStartDLM()V

    .line 179
    return-void
.end method

.method protected onStop()V
    .locals 2

    .prologue
    .line 183
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->onStop()V

    .line 184
    sget-object v0, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v1, "Activity Lifecycle: onStop"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 185
    invoke-direct {p0}, Lcom/belkin/activity/MainActivity;->checkIfAppUpgraded()V

    .line 186
    invoke-static {}, Lcom/belkin/utils/RateMe;->dismiss()V

    .line 187
    invoke-static {}, Lcom/belkin/utils/WemoAP;->dismiss()V

    .line 188
    return-void
.end method

.method public onTakePicture(Lcom/belkin/controller/listener/TakePictureListener;Landroid/net/Uri;)V
    .locals 3
    .param p1, "listener"    # Lcom/belkin/controller/listener/TakePictureListener;
    .param p2, "saveLocation"    # Landroid/net/Uri;

    .prologue
    .line 359
    sget-object v1, Lcom/belkin/activity/MainActivity;->TAG:Ljava/lang/String;

    const-string v2, "EDIT ICON: onTakePicture: Request received."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 360
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.media.action.IMAGE_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 361
    .local v0, "intent":Landroid/content/Intent;
    const-string v1, "output"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 362
    invoke-virtual {p0}, Lcom/belkin/activity/MainActivity;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->resolveActivity(Landroid/content/pm/PackageManager;)Landroid/content/ComponentName;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 363
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/belkin/activity/MainActivity;->isPhotoRequested:Z

    .line 364
    iput-object p1, p0, Lcom/belkin/activity/MainActivity;->takePictureListener:Lcom/belkin/controller/listener/TakePictureListener;

    .line 365
    iput-object p2, p0, Lcom/belkin/activity/MainActivity;->cameraImageLocationUri:Landroid/net/Uri;

    .line 366
    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    invoke-virtual {v1}, Lcom/belkin/wemo/PermissionController;->canAccessCamera()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 367
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/belkin/activity/MainActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 384
    :goto_0
    return-void

    .line 369
    :cond_0
    iget-object v1, p0, Lcom/belkin/activity/MainActivity;->mpermissionController:Lcom/belkin/wemo/PermissionController;

    new-instance v2, Lcom/belkin/activity/MainActivity$1;

    invoke-direct {v2, p0, v0}, Lcom/belkin/activity/MainActivity$1;-><init>(Lcom/belkin/activity/MainActivity;Landroid/content/Intent;)V

    invoke-virtual {v1, v2}, Lcom/belkin/wemo/PermissionController;->askCameraPermission(Lcom/belkin/wemo/PermissionController$PermissionListener;)V

    goto :goto_0

    .line 382
    :cond_1
    const-string v1, "EDIT ICON: onTakePicture: No activity available to respond to ACTION_IMAGE_CAPTURE intent."

    invoke-interface {p1, v1}, Lcom/belkin/controller/listener/TakePictureListener;->onTakePictureError(Ljava/lang/String;)V

    goto :goto_0
.end method
