.class public Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;
.super Lorg/cybergarage/upnp/ssdp/HTTPUSocket;
.source "SSDPSearchResponseSocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;
    }
.end annotation


# instance fields
.field SEARCH_EXPIRY_INTERVAL:J

.field private controlPoint:Lorg/cybergarage/upnp/ControlPoint;

.field private deviceSearchResponseThread:Ljava/lang/Thread;

.field udns:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/util/Date;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 39
    invoke-direct {p0}, Lorg/cybergarage/upnp/ssdp/HTTPUSocket;-><init>()V

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->udns:Ljava/util/HashMap;

    .line 36
    const-wide/16 v0, 0xbb8

    iput-wide v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->SEARCH_EXPIRY_INTERVAL:J

    .line 53
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 69
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    .line 40
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;I)V
    .locals 3
    .param p1, "bindAddr"    # Ljava/lang/String;
    .param p2, "port"    # I

    .prologue
    const/4 v2, 0x0

    .line 45
    invoke-direct {p0, p1, p2}, Lorg/cybergarage/upnp/ssdp/HTTPUSocket;-><init>(Ljava/lang/String;I)V

    .line 35
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->udns:Ljava/util/HashMap;

    .line 36
    const-wide/16 v0, 0xbb8

    iput-wide v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->SEARCH_EXPIRY_INTERVAL:J

    .line 53
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 69
    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    .line 46
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V

    .line 47
    return-void
.end method


# virtual methods
.method public getControlPoint()Lorg/cybergarage/upnp/ControlPoint;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    return-object v0
.end method

.method public post(Ljava/lang/String;ILorg/cybergarage/upnp/ssdp/SSDPSearchRequest;)Z
    .locals 1
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "req"    # Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;

    .prologue
    .line 165
    invoke-virtual {p3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchRequest;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->post(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public post(Ljava/lang/String;ILorg/cybergarage/upnp/ssdp/SSDPSearchResponse;)Z
    .locals 1
    .param p1, "addr"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "res"    # Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;

    .prologue
    .line 156
    invoke-virtual {p3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponse;->getHeader()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, p2, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->post(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public run()V
    .locals 10

    .prologue
    .line 75
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    .line 77
    .local v3, "thisThread":Ljava/lang/Thread;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->getControlPoint()Lorg/cybergarage/upnp/ControlPoint;

    move-result-object v0

    .line 79
    .local v0, "ctrlPoint":Lorg/cybergarage/upnp/ControlPoint;
    const/4 v1, 0x0

    .line 80
    .local v1, "iterations":I
    :cond_0
    :goto_0
    iget-object v5, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    if-ne v5, v3, :cond_1

    .line 83
    add-int/lit8 v1, v1, 0x1

    .line 84
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 85
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->receive()Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    move-result-object v2

    .line 86
    .local v2, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    if-nez v2, :cond_2

    .line 87
    const-string v5, "Discovery"

    const-string v6, "SSDP Packaet = Null"

    invoke-static {v5, v6}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    .end local v2    # "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :cond_1
    return-void

    .line 90
    .restart local v2    # "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :cond_2
    if-eqz v0, :cond_0

    .line 91
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getUSN()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/cybergarage/upnp/device/USN;->getUDN(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 92
    .local v4, "udn":Ljava/lang/String;
    const-string v5, "Discovery"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "Received the search response from IP : "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getLocalAddress()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " udn: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    const-string v5, "Controlee"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Socket"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Sensor"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Lightswitch"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "NetCamSensor"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "LinksysWNCSensor"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Insight"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Bridge"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Coffee"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Crockpot"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Maker"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Heater"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Purifier"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Humidifier"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_3

    const-string v5, "Dimmer"

    invoke-virtual {v4, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 95
    :cond_3
    const-string v5, "Discovery"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "UDN of device found in discovery..   "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 97
    iget-object v5, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->udns:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v6

    iget-object v5, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->udns:Ljava/util/HashMap;

    invoke-virtual {v5, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/Date;

    invoke-virtual {v5}, Ljava/util/Date;->getTime()J

    move-result-wide v8

    sub-long/2addr v6, v8

    iget-wide v8, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->SEARCH_EXPIRY_INTERVAL:J

    cmp-long v5, v6, v8

    if-lez v5, :cond_0

    .line 99
    :cond_4
    iget-object v5, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->udns:Ljava/util/HashMap;

    new-instance v6, Ljava/util/Date;

    invoke-direct {v6}, Ljava/util/Date;-><init>()V

    invoke-virtual {v5, v4, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 100
    new-instance v5, Ljava/lang/Thread;

    new-instance v6, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;

    const/4 v7, 0x1

    new-array v7, v7, [Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    const/4 v8, 0x0

    aput-object v2, v7, v8

    invoke-direct {v6, p0, v7}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket$SearchResponsePacketProcessor;-><init>(Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;[Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    invoke-direct {v5, v6}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v5}, Ljava/lang/Thread;->start()V

    goto/16 :goto_0
.end method

.method public setControlPoint(Lorg/cybergarage/upnp/ControlPoint;)V
    .locals 0
    .param p1, "ctrlp"    # Lorg/cybergarage/upnp/ControlPoint;

    .prologue
    .line 57
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->controlPoint:Lorg/cybergarage/upnp/ControlPoint;

    .line 58
    return-void
.end method

.method public start()V
    .locals 5

    .prologue
    .line 132
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v3, "Cyber.SSDPSearchResponseSocket/"

    invoke-direct {v1, v3}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 133
    .local v1, "name":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->getDatagramSocket()Ljava/net/DatagramSocket;

    move-result-object v2

    .line 135
    .local v2, "s":Ljava/net/DatagramSocket;
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v0

    .line 136
    .local v0, "localAddr":Ljava/net/InetAddress;
    if-eqz v0, :cond_0

    .line 137
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/Object;)Ljava/lang/StringBuffer;

    move-result-object v3

    const/16 v4, 0x3a

    invoke-virtual {v3, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 138
    invoke-virtual {v2}, Ljava/net/DatagramSocket;->getLocalPort()I

    move-result v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 140
    :cond_0
    new-instance v3, Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p0, v4}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    .line 141
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    invoke-virtual {v3}, Ljava/lang/Thread;->start()V

    .line 142
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchResponseSocket;->deviceSearchResponseThread:Ljava/lang/Thread;

    .line 148
    return-void
.end method
