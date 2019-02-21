.class public Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;
.super Ljava/lang/Object;
.source "EmailSubscriptionOnRemoteAccessListener.java"

# interfaces
.implements Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private isFirstEmailSubscriptionRequestIssued:Z

.field optFlag:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;->TAG:Ljava/lang/String;

    .line 16
    return-void
.end method


# virtual methods
.method public onRemoteAccessDisabled()V
    .locals 0

    .prologue
    .line 31
    return-void
.end method

.method public onRemoteAccessEnabled()V
    .locals 2

    .prologue
    .line 21
    iget-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;->isFirstEmailSubscriptionRequestIssued:Z

    if-nez v0, :cond_0

    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;->TAG:Ljava/lang/String;

    const-string v1, "Remote Access Enabled Notification received. Fetching Nest Devices."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->collectEmailIDToCloud()V

    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/belkin/wemo/cache/devicelist/listener/EmailSubscriptionOnRemoteAccessListener;->isFirstEmailSubscriptionRequestIssued:Z

    .line 26
    :cond_0
    return-void
.end method
