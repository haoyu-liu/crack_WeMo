.class public Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;
.super Ljava/lang/Object;
.source "NetworkStateListener.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$1;,
        Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;

.field public static final TYPE_NOT_WIFI:Ljava/lang/String; = "not_wifi"

.field public static final TYPE_NO_NETWORK_CONNECTION:Ljava/lang/String; = "notConnected"

.field public static final WEMO_ACTION_NETWORK_SWITCHED:Ljava/lang/String; = "com.wemo.belkin.NETWORK_SWICTHED"


# instance fields
.field private connectivityManager:Landroid/net/ConnectivityManager;

.field private currentSSID:Ljava/lang/String;

.field private isDevicePairingInProgress:Z

.field private networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const-class v0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;Landroid/net/ConnectivityManager;)V
    .locals 0
    .param p1, "networkUtils"    # Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;
    .param p2, "connectivityManager"    # Landroid/net/ConnectivityManager;

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 31
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->connectivityManager:Landroid/net/ConnectivityManager;

    .line 32
    return-void
.end method

.method static synthetic access$100()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;Landroid/content/Context;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;
    .param p1, "x1"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->onConnectivityChanged(Landroid/content/Context;)V

    return-void
.end method

.method private onConnectivityChanged(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 59
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "On Connectivity Changed. Is device pairing in progress: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-boolean v7, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress:Z

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-boolean v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress:Z

    if-nez v5, :cond_1

    .line 62
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->connectivityManager:Landroid/net/ConnectivityManager;

    invoke-virtual {v5}, Landroid/net/ConnectivityManager;->getActiveNetworkInfo()Landroid/net/NetworkInfo;

    move-result-object v1

    .line 63
    .local v1, "networkInfo":Landroid/net/NetworkInfo;
    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/net/NetworkInfo;->isConnected()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 64
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getType()I

    move-result v2

    .line 65
    .local v2, "networkType":I
    invoke-virtual {v1}, Landroid/net/NetworkInfo;->getTypeName()Ljava/lang/String;

    move-result-object v3

    .line 66
    .local v3, "networkTypeName":Ljava/lang/String;
    const/4 v4, 0x0

    .line 67
    .local v4, "ssid":Ljava/lang/String;
    const/4 v5, 0x1

    if-ne v2, v5, :cond_2

    .line 68
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->getSSID()Ljava/lang/String;

    move-result-object v4

    .line 73
    :goto_0
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "On Connectivity Changed: New Network Type: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Name: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; New SSID received: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, "; Last SSID: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->currentSSID:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->currentSSID:Ljava/lang/String;

    if-eqz v5, :cond_0

    if-eqz p1, :cond_0

    .line 80
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->currentSSID:Ljava/lang/String;

    invoke-virtual {v5, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 83
    sget-object v5, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    const-string v6, "On Connectivity Changed: APP connected to different newtork. Sending broadcast."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    new-instance v0, Landroid/content/Intent;

    const-string v5, "com.wemo.belkin.NETWORK_SWICTHED"

    invoke-direct {v0, v5}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 86
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p1, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 89
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_0
    iput-object v4, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->currentSSID:Ljava/lang/String;

    .line 94
    .end local v1    # "networkInfo":Landroid/net/NetworkInfo;
    .end local v2    # "networkType":I
    .end local v3    # "networkTypeName":Ljava/lang/String;
    .end local v4    # "ssid":Ljava/lang/String;
    :cond_1
    :goto_1
    return-void

    .line 70
    .restart local v1    # "networkInfo":Landroid/net/NetworkInfo;
    .restart local v2    # "networkType":I
    .restart local v3    # "networkTypeName":Ljava/lang/String;
    .restart local v4    # "ssid":Ljava/lang/String;
    :cond_2
    const-string v4, "not_wifi"

    goto :goto_0

    .line 91
    .end local v2    # "networkType":I
    .end local v3    # "networkTypeName":Ljava/lang/String;
    .end local v4    # "ssid":Ljava/lang/String;
    :cond_3
    const-string v5, "notConnected"

    iput-object v5, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->currentSSID:Ljava/lang/String;

    goto :goto_1
.end method


# virtual methods
.method public declared-synchronized isDevicePairingInProgress()Z
    .locals 3

    .prologue
    .line 97
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Is device pairing in progress: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-boolean v2, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress:Z

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

    .line 97
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setDevicePairingInProgress(Z)V
    .locals 3
    .param p1, "isDevicePairingInProgress"    # Z

    .prologue
    .line 102
    monitor-enter p0

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Set device pairing in progress: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    iput-boolean p1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->isDevicePairingInProgress:Z

    .line 105
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->onConnectivityChanged(Landroid/content/Context;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    monitor-exit p0

    return-void

    .line 102
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized startListening(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 35
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    const-string v2, "START listening for network changes"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 37
    .local v0, "intentFilter":Landroid/content/IntentFilter;
    const-string v1, "android.net.conn.CONNECTIVITY_CHANGE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 39
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;

    if-nez v1, :cond_0

    .line 40
    new-instance v1, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$NetworkSwitchedBroadcastReceiver;-><init>(Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;Lcom/belkin/wemo/cache/devicelist/NetworkStateListener$1;)V

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;

    .line 41
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    :cond_0
    monitor-exit p0

    return-void

    .line 35
    .end local v0    # "intentFilter":Landroid/content/IntentFilter;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method

.method public declared-synchronized stopListening(Landroid/content/Context;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 47
    monitor-enter p0

    :try_start_0
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    const-string v2, "STOP listening for network changes"

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;

    if-eqz v1, :cond_0

    .line 49
    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {p1, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 50
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    .line 52
    :catch_0
    move-exception v0

    .line 53
    .local v0, "e":Ljava/lang/IllegalArgumentException;
    :try_start_1
    sget-object v1, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->TAG:Ljava/lang/String;

    const-string v2, "IllegalArgumentException in method stopListening: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 54
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/belkin/wemo/cache/devicelist/NetworkStateListener;->receiver:Landroid/content/BroadcastReceiver;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 47
    .end local v0    # "e":Ljava/lang/IllegalArgumentException;
    :catchall_0
    move-exception v1

    monitor-exit p0

    throw v1
.end method
