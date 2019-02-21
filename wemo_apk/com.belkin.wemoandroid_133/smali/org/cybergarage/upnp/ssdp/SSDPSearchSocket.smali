.class public Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
.super Lorg/cybergarage/upnp/ssdp/HTTPMUSocket;
.source "SSDPSearchSocket.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

.field private deviceSearchThread:Ljava/lang/Thread;

.field private useIPv6Address:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 1
    .param p1, "bindAddr"    # Ljava/lang/String;
    .param p2, "port"    # I
    .param p3, "multicast"    # Ljava/lang/String;

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/cybergarage/upnp/ssdp/HTTPMUSocket;-><init>()V

    .line 121
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    .line 146
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    .line 60
    invoke-virtual {p0, p1, p3}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/lang/String;Ljava/lang/String;)Z

    .line 61
    return-void
.end method

.method public constructor <init>(Ljava/net/InetAddress;)V
    .locals 2
    .param p1, "bindAddr"    # Ljava/net/InetAddress;

    .prologue
    .line 68
    invoke-direct {p0}, Lorg/cybergarage/upnp/ssdp/HTTPMUSocket;-><init>()V

    .line 121
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    .line 146
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    .line 69
    invoke-virtual {p1}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    array-length v0, v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 70
    check-cast p1, Ljava/net/Inet6Address;

    .end local p1    # "bindAddr":Ljava/net/InetAddress;
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/net/Inet6Address;)Z

    .line 74
    :goto_0
    return-void

    .line 72
    .restart local p1    # "bindAddr":Ljava/net/InetAddress;
    :cond_0
    check-cast p1, Ljava/net/Inet4Address;

    .end local p1    # "bindAddr":Ljava/net/InetAddress;
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/net/Inet4Address;)Z

    goto :goto_0
.end method


# virtual methods
.method public addSearchListener(Lorg/cybergarage/upnp/device/SearchListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/SearchListener;

    .prologue
    .line 125
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->add(Ljava/lang/Object;)Z

    .line 126
    return-void
.end method

.method public open(Ljava/lang/String;)Z
    .locals 3
    .param p1, "bindAddr"    # Ljava/lang/String;

    .prologue
    const/4 v2, 0x1

    .line 108
    const-string v0, "239.255.255.250"

    .line 109
    .local v0, "addr":Ljava/lang/String;
    const/4 v1, 0x0

    iput-boolean v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    .line 110
    invoke-static {p1}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v1

    if-ne v1, v2, :cond_0

    .line 111
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    .line 112
    iput-boolean v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    .line 114
    :cond_0
    const/16 v1, 0x76c

    invoke-virtual {p0, v0, v1, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v1

    return v1
.end method

.method public open(Ljava/lang/String;Ljava/lang/String;)Z
    .locals 2
    .param p1, "bind"    # Ljava/lang/String;
    .param p2, "multicast"    # Ljava/lang/String;

    .prologue
    .line 90
    invoke-static {p1}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {p2}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 91
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    .line 97
    :goto_0
    const/16 v0, 0x76c

    invoke-virtual {p0, p2, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/lang/String;ILjava/lang/String;)Z

    move-result v0

    return v0

    .line 92
    :cond_0
    invoke-static {p1}, Lorg/cybergarage/net/HostInterface;->isIPv4Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p2}, Lorg/cybergarage/net/HostInterface;->isIPv4Address(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 93
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    goto :goto_0

    .line 95
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string v1, "Cannot open a UDP Socket for IPv6 address on IPv4 interface or viceversa"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public open(Ljava/net/Inet4Address;)Z
    .locals 2
    .param p1, "bindAddr"    # Ljava/net/Inet4Address;

    .prologue
    .line 80
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    .line 81
    const-string v0, "239.255.255.250"

    const/16 v1, 0x76c

    invoke-virtual {p0, v0, v1, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/lang/String;ILjava/net/InetAddress;)Z

    move-result v0

    return v0
.end method

.method public open(Ljava/net/Inet6Address;)Z
    .locals 2
    .param p1, "bindAddr"    # Ljava/net/Inet6Address;

    .prologue
    .line 85
    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->useIPv6Address:Z

    .line 86
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x76c

    invoke-virtual {p0, v0, v1, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->open(Ljava/lang/String;ILjava/net/InetAddress;)Z

    move-result v0

    return v0
.end method

.method public performSearchListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 4
    .param p1, "ssdpPacket"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 135
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3}, Lorg/cybergarage/util/ListenerList;->size()I

    move-result v1

    .line 136
    .local v1, "listenerSize":I
    const/4 v2, 0x0

    .local v2, "n":I
    :goto_0
    if-ge v2, v1, :cond_0

    .line 137
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v3, v2}, Lorg/cybergarage/util/ListenerList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/device/SearchListener;

    .line 138
    .local v0, "listener":Lorg/cybergarage/upnp/device/SearchListener;
    invoke-interface {v0, p1}, Lorg/cybergarage/upnp/device/SearchListener;->deviceSearchReceived(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    .line 136
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 140
    .end local v0    # "listener":Lorg/cybergarage/upnp/device/SearchListener;
    :cond_0
    return-void
.end method

.method public removeSearchListener(Lorg/cybergarage/upnp/device/SearchListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/SearchListener;

    .prologue
    .line 130
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchListenerList:Lorg/cybergarage/util/ListenerList;

    invoke-virtual {v0, p1}, Lorg/cybergarage/util/ListenerList;->remove(Ljava/lang/Object;)Z

    .line 131
    return-void
.end method

.method public run()V
    .locals 7

    .prologue
    .line 150
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    .line 151
    .local v3, "thisThread":Ljava/lang/Thread;
    const/4 v1, 0x0

    .line 152
    .local v1, "iterations":I
    :cond_0
    :goto_0
    iget-object v4, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    if-ne v4, v3, :cond_1

    .line 153
    invoke-static {}, Ljava/lang/Thread;->yield()V

    .line 154
    const-string v4, "Discovery"

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SSDP Search Socket iterations = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 155
    add-int/lit8 v1, v1, 0x1

    .line 157
    const/4 v2, 0x0

    .line 159
    .local v2, "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :try_start_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->receive()Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v2

    .line 166
    if-eqz v2, :cond_0

    .line 170
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->isDiscover()Z

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_0

    .line 171
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->performSearchListener(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V

    goto :goto_0

    .line 161
    :catch_0
    move-exception v0

    .line 173
    .end local v2    # "packet":Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    :cond_1
    return-void
.end method

.method public start()V
    .locals 5

    .prologue
    const/16 v4, 0x3a

    .line 176
    new-instance v1, Ljava/lang/StringBuffer;

    const-string v2, "Cyber.SSDPSearchSocket/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuffer;-><init>(Ljava/lang/String;)V

    .line 177
    .local v1, "name":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v0

    .line 179
    .local v0, "localAddr":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_0

    .line 180
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->getLocalAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 181
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->getLocalPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    move-result-object v2

    const-string v3, " -> "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 182
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->getMulticastAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuffer;->append(C)Ljava/lang/StringBuffer;

    .line 183
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->getMulticastPort()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuffer;->append(I)Ljava/lang/StringBuffer;

    .line 185
    :cond_0
    new-instance v2, Ljava/lang/Thread;

    invoke-virtual {v1}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    iput-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    .line 186
    iget-object v2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 187
    return-void
.end method

.method public stop()V
    .locals 1

    .prologue
    .line 192
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->close()Z

    .line 194
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->deviceSearchThread:Ljava/lang/Thread;

    .line 195
    return-void
.end method
