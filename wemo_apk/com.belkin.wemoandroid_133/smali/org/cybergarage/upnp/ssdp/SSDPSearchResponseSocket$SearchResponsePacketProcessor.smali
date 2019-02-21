.class public Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;
.super Ljava/lang/Object;
.source "SSDPSearchResponseSocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "SearchResponsePacketProcessor"
.end annotation


# instance fields
.field private packet:[Lorg/cybergarage/upnp/ssdp/SSDPPacket;

.field final synthetic this$0:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;


# direct methods
.method public varargs constructor <init>(Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;[Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 0
    .param p2, "packet"    # [Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;->this$0:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    iput-object p2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;->packet:[Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .line 110
    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 113
    const-string v1, "Discovery"

    const-string v2, "SSDP Packaet = Good ...Processing start@@@@@@@@@@"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 114
    iget-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;->this$0:Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;

    invoke-virtual {v1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->getControlPoint()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 115
    .local v0, "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    iget-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;->packet:[Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    invoke-virtual {v0, v1}, Lorg/cybergarage/upnp/ControlPoint;->searchResponseReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 116
    const-string v1, "Discovery"

    const-string v2, "SSDP Packaet = Good ...Processing end@@@@@@@@@@"

    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 117
    return-void
.end method
