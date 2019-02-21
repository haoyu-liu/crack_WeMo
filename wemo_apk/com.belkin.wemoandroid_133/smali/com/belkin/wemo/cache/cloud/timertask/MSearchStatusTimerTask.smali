.class public Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;
.super Ljava/util/TimerTask;
.source "MSearchStatusTimerTask.java"


# instance fields
.field private deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/cloud/SmartDiscovery;)V
    .locals 0
    .param p1, "devDiscoveryCloudCache"    # Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    .line 15
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;->deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    .line 16
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 20
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;->deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    if-eqz v0, :cond_0

    .line 21
    invoke-static {}, Lorg/cybergarage/upnp/ControlPoint;->didMSearchFail()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/timertask/MSearchStatusTimerTask;->deviceDiscoveryCloudCache:Lcom/belkin/wemo/cache/cloud/SmartDiscovery;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->onMSearchFailed()V

    .line 26
    :cond_0
    return-void
.end method
