.class public Lorg/cybergarage/upnp/control/RenewSubscriber;
.super Lorg/cybergarage/util/ThreadCore;
.source "RenewSubscriber.java"


# static fields
.field public static final INTERVAL:J = 0x78L


# instance fields
.field private ctrlPoint:Lorg/cybergarage/upnp/ControlPoint;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 0
    .param p1, "ctrlp"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/cybergarage/util/ThreadCore;-><init>()V

    .line 31
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/control/RenewSubscriber;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 32
    return-void
.end method


# virtual methods
.method public getControlPoint()Lorg/cybergarage/upnp/ControlPoint;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/cybergarage/upnp/control/RenewSubscriber;->ctrlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method public run()V
    .locals 5

    .prologue
    .line 56
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/RenewSubscriber;->getControlPoint()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 57
    .local v0, "ctrlp":Lorg/cybergarage/upnp/ControlPoint;
    const-wide/32 v2, 0x1d4c0

    .line 58
    .local v2, "renewInterval":J
    :goto_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/RenewSubscriber;->isRunnable()Z

    move-result v1

    const/4 v4, 0x1

    if-ne v1, v4, :cond_0

    .line 60
    :try_start_0
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    :goto_1
    invoke-virtual {v0}, Lorg/cybergarage/upnp/ControlPoint;->renewSubscriberService()V

    goto :goto_0

    .line 61
    :catch_0
    move-exception v1

    goto :goto_1

    .line 64
    :cond_0
    return-void
.end method

.method public setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 0
    .param p1, "ctrlp"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 42
    iput-object p1, p0, Lorg/cybergarage/upnp/control/RenewSubscriber;->ctrlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 43
    return-void
.end method
