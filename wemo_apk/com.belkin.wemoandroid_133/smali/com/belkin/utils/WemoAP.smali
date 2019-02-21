.class public Lcom/belkin/utils/WemoAP;
.super Ljava/lang/Object;
.source "WemoAP.java"


# static fields
.field private static final TAG:Ljava/lang/String;

.field private static final WEMO_AP_POPUP_WAIT_TIME:J = 0x1388L

.field private static dialog:Landroid/app/Dialog;


# instance fields
.field private final WAIT_TIME:J

.field private mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 29
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    .line 30
    const-class v0, Lcom/belkin/utils/WemoAP;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    const-wide/16 v0, 0x3e8

    iput-wide v0, p0, Lcom/belkin/utils/WemoAP;->WAIT_TIME:J

    return-void
.end method

.method static synthetic access$000(Lcom/belkin/utils/WemoAP;Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/WemoAP;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Lcom/belkin/utils/WemoAP;->show(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    return-void
.end method

.method static synthetic access$100(Lcom/belkin/utils/WemoAP;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/utils/WemoAP;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 26
    invoke-direct {p0, p1}, Lcom/belkin/utils/WemoAP;->setUserDismissThePopup(Landroid/content/Context;)V

    return-void
.end method

.method static synthetic access$200()Landroid/app/Dialog;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    return-object v0
.end method

.method public static dismiss()V
    .locals 1

    .prologue
    .line 46
    sget-object v0, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    if-eqz v0, :cond_0

    .line 47
    sget-object v0, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    .line 48
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    .line 50
    :cond_0
    return-void
.end method

.method public static handleWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 35
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 36
    .local v0, "handler":Landroid/os/Handler;
    new-instance v1, Lcom/belkin/utils/WemoAP$1;

    invoke-direct {v1, p0, p1}, Lcom/belkin/utils/WemoAP$1;-><init>(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 43
    return-void
.end method

.method private setUserDismissThePopup(Landroid/content/Context;)V
    .locals 2
    .param p1, "ctx"    # Landroid/content/Context;

    .prologue
    .line 78
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 79
    .local v0, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setUserDismissPluginPopup(Z)V

    .line 80
    return-void
.end method

.method private show(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 9
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 53
    sget-object v6, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    const-string v7, "SHOW WemoAP Pop-up"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->getAppNetworkType()Ljava/lang/String;

    move-result-object v0

    .line 59
    .local v0, "appNetworkType":Ljava/lang/String;
    new-instance v6, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v6, p1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v6, p0, Lcom/belkin/utils/WemoAP;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 60
    iget-object v6, p0, Lcom/belkin/utils/WemoAP;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isPluginConnected()Z

    move-result v1

    .line 61
    .local v1, "isPluginConnected":Z
    iget-object v6, p0, Lcom/belkin/utils/WemoAP;->mNetworkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getNetworkName()Ljava/lang/String;

    move-result-object v3

    .line 62
    .local v3, "networkname":Ljava/lang/String;
    sget-object v6, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Network Mode is Local:  "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " - App Network Type is: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " -isPluginConnected: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " -networkname: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    invoke-virtual {p2}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getNetworkType()Ljava/lang/String;

    move-result-object v2

    .line 66
    .local v2, "networkType":Ljava/lang/String;
    sget-object v6, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "; Network Type: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    new-instance v4, Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v4, p1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 69
    .local v4, "sharePref":Lcom/belkin/wemo/cache/utils/SharePreferences;
    invoke-virtual {v4}, Lcom/belkin/wemo/cache/utils/SharePreferences;->isUserDismissPluginPopup()Z

    move-result v5

    .line 70
    .local v5, "userDismissPluginPopup":Z
    sget-object v6, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "; Is user dismissed the plugin popup: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    if-eqz v1, :cond_0

    const-string v6, "Cellular"

    invoke-virtual {v3, v6}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_0

    if-nez v5, :cond_0

    .line 72
    sget-object v6, Lcom/belkin/utils/WemoAP;->TAG:Ljava/lang/String;

    const-string v7, "Its time to show popup"

    invoke-static {v6, v7}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-direct {p0, p1, p2}, Lcom/belkin/utils/WemoAP;->showWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V

    goto/16 :goto_0
.end method

.method private declared-synchronized showWemoAPPopup(Landroid/content/Context;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;)V
    .locals 6
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "mDeviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .prologue
    .line 84
    monitor-enter p0

    :try_start_0
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v3, :cond_0

    .line 120
    :goto_0
    monitor-exit p0

    return-void

    .line 88
    :cond_0
    :try_start_1
    new-instance v3, Landroid/app/Dialog;

    invoke-direct {v3, p1}, Landroid/app/Dialog;-><init>(Landroid/content/Context;)V

    sput-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    .line 89
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/app/Dialog;->requestWindowFeature(I)Z

    .line 90
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setCanceledOnTouchOutside(Z)V

    .line 91
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    invoke-virtual {v3}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;

    move-result-object v3

    new-instance v4, Landroid/graphics/drawable/ColorDrawable;

    const/4 v5, 0x0

    invoke-direct {v4, v5}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v3, v4}, Landroid/view/Window;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 92
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    const v4, 0x7f030005

    invoke-virtual {v3, v4}, Landroid/app/Dialog;->setContentView(I)V

    .line 94
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    const v4, 0x7f090011

    invoke-virtual {v3, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 95
    .local v0, "btnRateNo":Landroid/widget/Button;
    new-instance v3, Lcom/belkin/utils/WemoAP$2;

    invoke-direct {v3, p0, p1}, Lcom/belkin/utils/WemoAP$2;-><init>(Lcom/belkin/utils/WemoAP;Landroid/content/Context;)V

    invoke-virtual {v0, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    sget-object v3, Lcom/belkin/utils/WemoAP;->dialog:Landroid/app/Dialog;

    const v4, 0x7f090010

    invoke-virtual {v3, v4}, Landroid/app/Dialog;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 103
    .local v1, "btnReportProblem":Landroid/widget/Button;
    new-instance v3, Lcom/belkin/utils/WemoAP$3;

    invoke-direct {v3, p0}, Lcom/belkin/utils/WemoAP$3;-><init>(Lcom/belkin/utils/WemoAP;)V

    invoke-virtual {v1, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 109
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 110
    .local v2, "handler":Landroid/os/Handler;
    new-instance v3, Lcom/belkin/utils/WemoAP$4;

    invoke-direct {v3, p0, p2, p1}, Lcom/belkin/utils/WemoAP$4;-><init>(Lcom/belkin/utils/WemoAP;Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    const-wide/16 v4, 0x3e8

    invoke-virtual {v2, v3, v4, v5}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 84
    .end local v0    # "btnRateNo":Landroid/widget/Button;
    .end local v1    # "btnReportProblem":Landroid/widget/Button;
    .end local v2    # "handler":Landroid/os/Handler;
    :catchall_0
    move-exception v3

    monitor-exit p0

    throw v3
.end method
