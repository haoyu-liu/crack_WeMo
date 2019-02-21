.class public Lorg/cybergarage/upnp/device/Advertiser;
.super Lorg/cybergarage/util/ThreadCore;
.source "Advertiser.java"


# instance fields
.field private device:Lorg/cybergarage/upnp/Device;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/cybergarage/util/ThreadCore;-><init>()V

    .line 31
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/device/Advertiser;->setDevice(Lorg/cybergarage/upnp/Device;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getDevice()Lorg/cybergarage/upnp/Device;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/cybergarage/upnp/device/Advertiser;->device:Lorg/cybergarage/upnp/Device;

    return-object v0
.end method

.method public run()V
    .locals 14

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/cybergarage/upnp/device/Advertiser;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 57
    .local v0, "dev":Lorg/cybergarage/upnp/Device;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getLeaseTime()I

    move-result v1

    int-to-long v2, v1

    .line 59
    .local v2, "leaseTime":J
    :goto_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/device/Advertiser;->isRunnable()Z

    move-result v1

    const/4 v6, 0x1

    if-ne v1, v6, :cond_0

    .line 60
    const-wide/16 v6, 0x4

    div-long v6, v2, v6

    long-to-float v1, v2

    float-to-double v8, v1

    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v10

    const-wide/high16 v12, 0x3fd0000000000000L    # 0.25

    mul-double/2addr v10, v12

    mul-double/2addr v8, v10

    double-to-long v8, v8

    add-long v4, v6, v8

    .line 61
    .local v4, "notifyInterval":J
    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    .line 63
    :try_start_0
    invoke-static {v4, v5}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    :goto_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->announce()V

    goto :goto_0

    .line 64
    :catch_0
    move-exception v1

    goto :goto_1

    .line 67
    .end local v4    # "notifyInterval":J
    :cond_0
    return-void
.end method

.method public setDevice(Lorg/cybergarage/upnp/Device;)V
    .locals 0
    .param p1, "dev"    # Lorg/cybergarage/upnp/Device;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/cybergarage/upnp/device/Advertiser;->device:Lorg/cybergarage/upnp/Device;

    .line 43
    return-void
.end method
