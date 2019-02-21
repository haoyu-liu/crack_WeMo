.class Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "ControlPoint.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cybergarage/upnp/ControlPoint;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ControlPointCleanupsRunnable"
.end annotation


# instance fields
.field final synthetic this$0:Lorg/cybergarage/upnp/ControlPoint;

.field private timeoutLatch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/ControlPoint;Ljava/util/concurrent/CountDownLatch;)V
    .locals 0
    .param p2, "timeoutLatch"    # Ljava/util/concurrent/CountDownLatch;

    .prologue
    .line 1366
    iput-object p1, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 1367
    iput-object p2, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->timeoutLatch:Ljava/util/concurrent/CountDownLatch;

    .line 1368
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 1372
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-static {v5}, Lorg/cybergarage/upnp/ControlPoint;->access$000(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;

    move-result-object v3

    .line 1373
    .local v3, "ssdpNotifySocketList":Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->stop()V

    .line 1374
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->close()V

    .line 1375
    invoke-virtual {v3}, Lorg/cybergarage/upnp/ssdp/SSDPNotifySocketList;->clear()V

    .line 1377
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-static {v5}, Lorg/cybergarage/upnp/ControlPoint;->access$100(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;

    move-result-object v4

    .line 1378
    .local v4, "ssdpSearchResponseSocketList":Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->stop()V

    .line 1379
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->close()V

    .line 1380
    invoke-virtual {v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocketList;->clear()V

    .line 1382
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-static {v5}, Lorg/cybergarage/upnp/ControlPoint;->access$200(Lorg/cybergarage/upnp/ControlPoint;)Lorg/cybergarage/http/HTTPServerList;

    move-result-object v1

    .line 1383
    .local v1, "httpServerList":Lorg/cybergarage/http/HTTPServerList;
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->stop()V

    .line 1384
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->close()V

    .line 1385
    invoke-virtual {v1}, Lorg/cybergarage/http/HTTPServerList;->clear()V

    .line 1391
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/ControlPoint;->getDeviceDisposer()Lorg/cybergarage/upnp/device/Disposer;

    move-result-object v0

    .line 1392
    .local v0, "disposer":Lorg/cybergarage/upnp/device/Disposer;
    if-eqz v0, :cond_0

    .line 1393
    invoke-virtual {v0}, Lorg/cybergarage/upnp/device/Disposer;->stop()V

    .line 1394
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/ControlPoint;->setDeviceDisposer(Lorg/cybergarage/upnp/device/Disposer;)V

    .line 1401
    :cond_0
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/ControlPoint;->getRenewSubscriber()Lorg/cybergarage/upnp/control/RenewSubscriber;

    move-result-object v2

    .line 1402
    .local v2, "renewSub":Lorg/cybergarage/upnp/control/RenewSubscriber;
    if-eqz v2, :cond_1

    .line 1403
    invoke-virtual {v2}, Lorg/cybergarage/upnp/control/RenewSubscriber;->stop()V

    .line 1404
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->this$0:Lorg/cybergarage/upnp/ControlPoint;

    invoke-virtual {v5, v6}, Lorg/cybergarage/upnp/ControlPoint;->setRenewSubscriber(Lorg/cybergarage/upnp/control/RenewSubscriber;)V

    .line 1407
    :cond_1
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->timeoutLatch:Ljava/util/concurrent/CountDownLatch;

    if-eqz v5, :cond_2

    .line 1408
    iget-object v5, p0, Lorg/cybergarage/upnp/ControlPoint$ControlPointCleanupsRunnable;->timeoutLatch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v5}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 1410
    :cond_2
    return-void
.end method
