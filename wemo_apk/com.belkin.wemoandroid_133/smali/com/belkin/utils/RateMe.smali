.class public Lcom/belkin/utils/RateMe;
.super Ljava/lang/Object;
.source "RateMe.java"


# static fields
.field private static final RATE_ME_POPUP_WAIT_TIME:J = 0x3a98L

.field private static final TAG:Ljava/lang/String;

.field private static dialog:Landroid/app/Dialog;


# instance fields
.field private final ANDROID_APP_STORE_URL_PREFIX:Ljava/lang/String;

.field private final LOCALYTICS_RATE_ME_SELECTION_KEY:Ljava/lang/String;

.field private final LOCALYTICS_RATE_ME_TAG:Ljava/lang/String;

.field private final REPORT_A_PROBLEM_URL:Ljava/lang/String;

.field private final SUCCESS_COUNT:J

.field private final WAIT_TIME:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 39
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    .line 40
    const-class v0, Lcom/belkin/utils/RateMe;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    const-wide/16 v0, 0x1f40

    iput-wide v0, p0, Lcom/belkin/utils/RateMe;->WAIT_TIME:J

    .line 42
    const-wide/16 v0, 0x7

    iput-wide v0, p0, Lcom/belkin/utils/RateMe;->SUCCESS_COUNT:J

    .line 43
    const-string v0, "market://details?id="

    iput-object v0, p0, Lcom/belkin/utils/RateMe;->ANDROID_APP_STORE_URL_PREFIX:Ljava/lang/String;

    .line 44
    const-string v0, "file:///android_asset/www/more/more_menu.html"

    iput-object v0, p0, Lcom/belkin/utils/RateMe;->REPORT_A_PROBLEM_URL:Ljava/lang/String;

    .line 45
    const-string v0, "App_RatingsPopUp"

    iput-object v0, p0, Lcom/belkin/utils/RateMe;->LOCALYTICS_RATE_ME_TAG:Ljava/lang/String;

    .line 46
    const-string v0, "UserSelection"

    iput-object v0, p0, Lcom/belkin/utils/RateMe;->LOCALYTICS_RATE_ME_SELECTION_KEY:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Lcom/belkin/utils/RateMe;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/RateMe;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 36
    invoke-direct {p0, p1, p2}, Lcom/belkin/utils/RateMe;->show(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/RateMe;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/belkin/utils/RateMe;->setUserDidRateWeMo(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$300(Lcom/belkin/utils/RateMe;I)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/RateMe;
    .param p1, "x1"    # I

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/belkin/utils/RateMe;->updateLocalytics(I)V

    return-void
.end method

.method static synthetic access$400(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/RateMe;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 36
    invoke-direct {p0, p1}, Lcom/belkin/utils/RateMe;->setUserDidDeclineRatingsPopup(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$500()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 36
    sget-object v0, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public static dismiss()V
    .locals 1

    .prologue
    .line 87
    sget-object v0, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 88
    sget-object v0, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 89
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    .line 91
    :cond_0
    return-void
.end method

.method public static doNotShowRatingPopUp(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 105
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 106
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDidDeclineRatingsPopup(Z)V

    .line 107
    return-void
.end method

.method public static handleRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 54
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 55
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/belkin/utils/RateMe$1;

    invoke-direct {v1, p0, p1}, Lcom/belkin/utils/RateMe$1;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    const-wide/16 v2, 0x3a98

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 62
    return-void
.end method

.method private incrementFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 115
    new-instance v1, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v1, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 116
    .local v1, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getFullSuccessfulDiscoveryCounter()I

    move-result v0

    .line 117
    .local v0, "currentFullSuccessfulDiscoveryCounter":I
    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setFullSuccessfulDiscoveryCounter(I)V

    .line 118
    return-void
.end method

.method private isItTimeToShow(IZZ)Z
    .locals 4
    .param p1, "fullSuccessfulDiscoveryCounter"    # I
    .param p2, "userDidRateWeMo"    # Z
    .param p3, "userDidDeclineRatingsPopup"    # Z

    .prologue
    .line 288
    sget-object v0, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "fullSuccessfulDiscoveryCounter:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 289
    sget-object v0, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "userDidRateWeMo:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 290
    sget-object v0, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "userDidDeclineRatingsPopup:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    if-nez p3, :cond_0

    if-nez p2, :cond_0

    int-to-long v0, p1

    const-wide/16 v2, 0x7

    cmp-long v0, v0, v2

    if-lez v0, :cond_0

    .line 293
    const/4 v0, 0x1

    .line 296
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private isRateMeStillValid(Landroid/content/Context;)Z
    .locals 3
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 173
    if-nez p1, :cond_1

    .line 178
    :cond_0
    :goto_0
    return v1

    .line 177
    :cond_1
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 178
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isUserDidDeclineRatingsPopup()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isUserDidRateWeMo()Z

    move-result v2

    if-nez v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method public static reset(Landroid/content/Context;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 71
    if-nez p0, :cond_0

    .line 79
    :goto_0
    return-void

    .line 75
    :cond_0
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 76
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setFullSuccessfulDiscoveryCounter(I)V

    .line 77
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDidRateWeMo(Z)V

    .line 78
    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDidDeclineRatingsPopup(Z)V

    goto :goto_0
.end method

.method public static resetFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V
    .locals 3
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 99
    sget-object v1, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    const-string v2, "Resetting Full Successfull Discovery Counter."

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p0}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 101
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setFullSuccessfulDiscoveryCounter(I)V

    .line 102
    return-void
.end method

.method private setUserDidDeclineRatingsPopup(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 195
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 196
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDidDeclineRatingsPopup(Z)V

    .line 197
    return-void
.end method

.method private setUserDidRateWeMo(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 186
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 187
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDidRateWeMo(Z)V

    .line 188
    return-void
.end method

.method private show(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 13
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 128
    sget-object v10, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    const-string v11, "SHOW RateMe Pop-up Requested."

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 133
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->getAppNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 134
    .local v0, "appNetworkType":Ljava/lang/String;
    sget-object v10, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Network Mode is Local:  "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, " - App Network Type is: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v10

    if-nez v10, :cond_2

    const-string v10, "Home"

    invoke-virtual {v0, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_0

    :cond_2
    invoke-direct {p0, p1}, Lcom/belkin/utils/RateMe;->isRateMeStillValid(Landroid/content/Context;)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 139
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->didUnicastFailForAnyDevice()Z

    move-result v1

    .line 140
    .local v1, "didUnicastFailForAnyDevice":Z
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/LEDStatusTracker;->isAnyLEDOffline()Z

    move-result v3

    .line 141
    .local v3, "isAnyLEDOffline":Z
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isDevicePairingInProgress()Z

    move-result v5

    .line 142
    .local v5, "isDevicePairingInProgress":Z
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNetworkType()Ljava/lang/String;

    move-result-object v6

    .line 143
    .local v6, "networkType":Ljava/lang/String;
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->isDeviceNotReachable()Z

    move-result v4

    .line 145
    .local v4, "isDeviceNotReachable":Z
    sget-object v10, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "SHOW RateMe Pop-up Requested. didUnicastFailForAnyDevice: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; isAnyLEDOffline: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; isDevicePairingInProgress: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; Network Type: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string v12, "; isDeviceNotReachable: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    if-nez v1, :cond_3

    if-nez v3, :cond_3

    if-nez v5, :cond_3

    const-string v10, "WEMO"

    invoke-virtual {v6, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-nez v10, :cond_3

    if-eqz v4, :cond_4

    .line 152
    :cond_3
    invoke-static {p1}, Lcom/belkin/utils/RateMe;->resetFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V

    goto/16 :goto_0

    .line 155
    :cond_4
    invoke-direct {p0, p1}, Lcom/belkin/utils/RateMe;->incrementFullSuccessfulDiscoveryCounter(Landroid/content/Context;)V

    .line 158
    new-instance v7, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v7, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 159
    .local v7, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->getFullSuccessfulDiscoveryCounter()I

    move-result v2

    .line 160
    .local v2, "fullSuccessfulDiscoveryCounter":I
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isUserDidRateWeMo()Z

    move-result v9

    .line 161
    .local v9, "userDidRateWeMo":Z
    invoke-virtual {v7}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isUserDidDeclineRatingsPopup()Z

    move-result v8

    .line 162
    .local v8, "userDidDeclineRatingsPopup":Z
    invoke-direct {p0, v2, v9, v8}, Lcom/belkin/utils/RateMe;->isItTimeToShow(IZZ)Z

    move-result v10

    if-eqz v10, :cond_0

    .line 163
    invoke-direct {p0, p1, p2}, Lcom/belkin/utils/RateMe;->showRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    goto/16 :goto_0
.end method

.method private declared-synchronized showRateMePopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 8
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 204
    monitor-enter p0

    :try_start_0
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v5, :cond_0

    .line 280
    :goto_0
    monitor-exit p0

    return-void

    .line 208
    :cond_0
    :try_start_1
    new-instance v5, Landroid/app/Dialog;

    invoke-direct {v5, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    .line 209
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 210
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const/4 v6, 0x0

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 211
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    invoke-virtual {v5}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v5

    new-instance v6, Landroid/graphics/drawable/ColorDrawable;

    const/4 v7, 0x0

    invoke-direct {v6, v7}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v5, v6}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 212
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const v6, 0x7f030003

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->setContentView(I)V

    .line 214
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const v6, 0x7f09000b

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 215
    .local v1, "btnRateMe":Landroid/widget/Button;
    new-instance v5, Lcom/belkin/utils/RateMe$2;

    invoke-direct {v5, p0, p1}, Lcom/belkin/utils/RateMe$2;-><init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    invoke-virtual {v1, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 230
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const v6, 0x7f09000c

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/Button;

    .line 231
    .local v2, "btnRateNo":Landroid/widget/Button;
    new-instance v5, Lcom/belkin/utils/RateMe$3;

    invoke-direct {v5, p0, p1}, Lcom/belkin/utils/RateMe$3;-><init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    invoke-virtual {v2, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 240
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const v6, 0x7f09000d

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/Button;

    .line 241
    .local v3, "btnReportProblem":Landroid/widget/Button;
    new-instance v5, Lcom/belkin/utils/RateMe$4;

    invoke-direct {v5, p0, p1}, Lcom/belkin/utils/RateMe$4;-><init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    invoke-virtual {v3, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 251
    sget-object v5, Lcom/belkin/utils/RateMe;->dialog:Landroid/app/Dialog;

    const v6, 0x7f09000e

    invoke-virtual {v5, v6}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 252
    .local v0, "btnRateLater":Landroid/widget/Button;
    new-instance v5, Lcom/belkin/utils/RateMe$5;

    invoke-direct {v5, p0, p1}, Lcom/belkin/utils/RateMe$5;-><init>(Lcom/belkin/utils/RateMe;Landroid/content/Context;)V

    invoke-virtual {v0, v5}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 261
    new-instance v4, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v5

    invoke-direct {v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 262
    .local v4, "handler":Landroid/os/Handler;
    new-instance v5, Lcom/belkin/utils/RateMe$6;

    invoke-direct {v5, p0, p2, p1}, Lcom/belkin/utils/RateMe$6;-><init>(Lcom/belkin/utils/RateMe;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    const-wide/16 v6, 0x1f40

    invoke-virtual {v4, v5, v6, v7}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto/16 :goto_0

    .line 204
    .end local v0    # "btnRateLater":Landroid/widget/Button;
    .end local v1    # "btnRateMe":Landroid/widget/Button;
    .end local v2    # "btnRateNo":Landroid/widget/Button;
    .end local v3    # "btnReportProblem":Landroid/widget/Button;
    .end local v4    # "handler":Landroid/os/Handler;
    :catchall_0
    move-exception v5

    monitor-exit p0

    throw v5
.end method

.method private updateLocalytics(I)V
    .locals 4
    .param p1, "selection"    # I

    .prologue
    .line 303
    if-gez p1, :cond_0

    .line 311
    :goto_0
    return-void

    .line 307
    :cond_0
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 308
    .local v0, "values":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v1, "UserSelection"

    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    const-string v1, "App_RatingsPopUp"

    invoke-static {v1, v0}, Lcom/localytics/android/Localytics;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 310
    sget-object v1, Lcom/belkin/utils/RateMe;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "updateLocalytics:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
