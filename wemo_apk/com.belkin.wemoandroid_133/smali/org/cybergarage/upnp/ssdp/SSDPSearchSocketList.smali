.class public Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;
.super Ljava/util/Vector;
.source "SSDPSearchSocketList.java"


# instance fields
.field private binds:[Ljava/net/InetAddress;

.field private multicastIPv4:Ljava/lang/String;

.field private multicastIPv6:Ljava/lang/String;

.field private port:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 40
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 35
    const-string v0, "239.255.255.250"

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv4:Ljava/lang/String;

    .line 36
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv6:Ljava/lang/String;

    .line 37
    const/16 v0, 0x76c

    iput v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    .line 41
    return-void
.end method

.method public constructor <init>([Ljava/net/InetAddress;)V
    .locals 1
    .param p1, "binds"    # [Ljava/net/InetAddress;

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 35
    const-string v0, "239.255.255.250"

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv4:Ljava/lang/String;

    .line 36
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv6:Ljava/lang/String;

    .line 37
    const/16 v0, 0x76c

    iput v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    .line 47
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 48
    return-void
.end method

.method public constructor <init>([Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "binds"    # [Ljava/net/InetAddress;
    .param p2, "port"    # I
    .param p3, "multicastIPv4"    # Ljava/lang/String;
    .param p4, "multicastIPv6"    # Ljava/lang/String;

    .prologue
    .line 58
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 35
    const-string v0, "239.255.255.250"

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv4:Ljava/lang/String;

    .line 36
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv6:Ljava/lang/String;

    .line 37
    const/16 v0, 0x76c

    iput v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    .line 59
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 60
    iput p2, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    .line 61
    iput-object p3, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv4:Ljava/lang/String;

    .line 62
    iput-object p4, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv6:Ljava/lang/String;

    .line 63
    return-void
.end method


# virtual methods
.method public addSearchListener(Lorg/cybergarage/upnp/device/SearchListener;)V
    .locals 3
    .param p1, "listener"    # Lorg/cybergarage/upnp/device/SearchListener;

    .prologue
    .line 79
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->size()I

    move-result v1

    .line 80
    .local v1, "nServers":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 81
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->getSSDPSearchSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    move-result-object v2

    .line 82
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    invoke-virtual {v2, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->addSearchListener(Lorg/cybergarage/upnp/device/SearchListener;)V

    .line 80
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 84
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_0
    return-void
.end method

.method public close()V
    .locals 3

    .prologue
    .line 122
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->size()I

    move-result v1

    .line 123
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 124
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->getSSDPSearchSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    move-result-object v2

    .line 125
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->close()Z

    .line 123
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 127
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->clear()V

    .line 128
    return-void
.end method

.method public getSSDPSearchSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 74
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    return-object v0
.end method

.method public open()Z
    .locals 9

    .prologue
    .line 92
    iget-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->binds:[Ljava/net/InetAddress;

    .line 94
    .local v1, "binds":[Ljava/net/InetAddress;
    if-eqz v1, :cond_0

    .line 95
    array-length v6, v1

    new-array v0, v6, [Ljava/lang/String;

    .line 96
    .local v0, "bindAddresses":[Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "i":I
    :goto_0
    array-length v6, v1

    if-ge v2, v6, :cond_1

    .line 97
    aget-object v6, v1, v2

    invoke-virtual {v6}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v2

    .line 96
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 100
    .end local v0    # "bindAddresses":[Ljava/lang/String;
    .end local v2    # "i":I
    :cond_0
    invoke-static {}, Lorg/cybergarage/net/HostInterface;->getNHostAddresses()I

    move-result v4

    .line 101
    .local v4, "nHostAddrs":I
    new-array v0, v4, [Ljava/lang/String;

    .line 102
    .restart local v0    # "bindAddresses":[Ljava/lang/String;
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_1
    if-ge v3, v4, :cond_1

    .line 103
    invoke-static {v3}, Lorg/cybergarage/net/HostInterface;->getHostAddress(I)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v0, v3

    .line 102
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 107
    .end local v3    # "n":I
    .end local v4    # "nHostAddrs":I
    :cond_1
    const/4 v2, 0x0

    .restart local v2    # "i":I
    :goto_2
    array-length v6, v0

    if-ge v2, v6, :cond_4

    .line 108
    aget-object v6, v0, v2

    if-eqz v6, :cond_2

    .line 110
    aget-object v6, v0, v2

    invoke-static {v6}, Lorg/cybergarage/net/HostInterface;->isIPv6Address(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 111
    new-instance v5, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    aget-object v6, v0, v2

    iget v7, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    iget-object v8, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv6:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .line 114
    .local v5, "ssdpSearchSocket":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :goto_3
    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->add(Ljava/lang/Object;)Z

    .line 107
    .end local v5    # "ssdpSearchSocket":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 113
    :cond_3
    new-instance v5, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    aget-object v6, v0, v2

    iget v7, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->port:I

    iget-object v8, p0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->multicastIPv4:Ljava/lang/String;

    invoke-direct {v5, v6, v7, v8}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    .restart local v5    # "ssdpSearchSocket":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    goto :goto_3

    .line 117
    .end local v5    # "ssdpSearchSocket":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_4
    const/4 v6, 0x1

    return v6
.end method

.method public start()V
    .locals 3

    .prologue
    .line 136
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->size()I

    move-result v1

    .line 137
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 138
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->getSSDPSearchSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    move-result-object v2

    .line 139
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->start()V

    .line 137
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 3

    .prologue
    .line 145
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->size()I

    move-result v1

    .line 146
    .local v1, "nSockets":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_0
    if-ge v0, v1, :cond_0

    .line 147
    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;->getSSDPSearchSocket(I)Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;

    move-result-object v2

    .line 148
    .local v2, "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;->stop()V

    .line 146
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 150
    .end local v2    # "sock":Lorg/cybergarage/upnp/ssdp/SSDPSearchSocket;
    :cond_0
    return-void
.end method
