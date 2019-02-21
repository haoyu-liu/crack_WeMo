.class public Lorg/cybergarage/upnp/xml/DeviceData;
.super Lorg/cybergarage/upnp/xml/NodeData;
.source "DeviceData.java"


# instance fields
.field private advertiser:Lorg/cybergarage/upnp/device/Advertiser;

.field private controlActionListenerList:Lorg/cybergarage/util/ListenerList;

.field private descriptionFile:Ljava/io/File;

.field private descriptionURI:Ljava/lang/String;

.field private httpBinds:[Ljava/net/InetAddress;

.field private httpPort:I

.field private httpServerList:Lorg/cybergarage/http/HTTPServerList;

.field private leaseTime:I

.field private location:Ljava/lang/String;

.field private ssdpBinds:[Ljava/net/InetAddress;

.field private ssdpMulticastIPv4:Ljava/lang/String;

.field private ssdpMulticastIPv6:Ljava/lang/String;

.field private ssdpPacket:Lorg/cybergarage/upnp/ssdp/SSDPPacket;

.field private ssdpPort:I

.field private ssdpSearchSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 36
    invoke-direct {p0}, Lorg/cybergarage/upnp/xml/NodeData;-><init>()V

    .line 43
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionURI:Ljava/lang/String;

    .line 44
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionFile:Ljava/io/File;

    .line 66
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->location:Ljava/lang/String;

    .line 80
    const/16 v0, 0x708

    iput v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->leaseTime:I

    .line 96
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    .line 105
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpBinds:[Ljava/net/InetAddress;

    .line 119
    const/16 v0, 0xfa4

    iput v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpPort:I

    .line 133
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->controlActionListenerList:Lorg/cybergarage/util/ListenerList;

    .line 149
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpSearchSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    .line 150
    const-string v0, "239.255.255.250"

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv4:Ljava/lang/String;

    .line 151
    invoke-static {}, Lorg/cybergarage/upnp/ssdp/SSDP;->getIPv6Address()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv6:Ljava/lang/String;

    .line 152
    const/16 v0, 0x76c

    iput v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPort:I

    .line 153
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpBinds:[Ljava/net/InetAddress;

    .line 246
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPacket:Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .line 260
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->advertiser:Lorg/cybergarage/upnp/device/Advertiser;

    .line 37
    return-void
.end method


# virtual methods
.method public getAdvertiser()Lorg/cybergarage/upnp/device/Advertiser;
    .locals 1

    .prologue
    .line 269
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->advertiser:Lorg/cybergarage/upnp/device/Advertiser;

    return-object v0
.end method

.method public getControlActionListenerList()Lorg/cybergarage/util/ListenerList;
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->controlActionListenerList:Lorg/cybergarage/util/ListenerList;

    return-object v0
.end method

.method public getDescriptionFile()Ljava/io/File;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionFile:Ljava/io/File;

    return-object v0
.end method

.method public getDescriptionURI()Ljava/lang/String;
    .locals 1

    .prologue
    .line 51
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionURI:Ljava/lang/String;

    return-object v0
.end method

.method public getHTTPBindAddress()[Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 112
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpBinds:[Ljava/net/InetAddress;

    return-object v0
.end method

.method public getHTTPPort()I
    .locals 1

    .prologue
    .line 122
    iget v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpPort:I

    return v0
.end method

.method public getHTTPServerList()Lorg/cybergarage/http/HTTPServerList;
    .locals 3

    .prologue
    .line 99
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    if-nez v0, :cond_0

    .line 100
    new-instance v0, Lorg/cybergarage/http/HTTPServerList;

    iget-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpBinds:[Ljava/net/InetAddress;

    iget v2, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpPort:I

    invoke-direct {v0, v1, v2}, Lorg/cybergarage/http/HTTPServerList;-><init>([Ljava/net/InetAddress;I)V

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    .line 102
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpServerList:Lorg/cybergarage/http/HTTPServerList;

    return-object v0
.end method

.method public getLeaseTime()I
    .locals 1

    .prologue
    .line 84
    iget v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->leaseTime:I

    return v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->location:Ljava/lang/String;

    return-object v0
.end method

.method public getMulticastIPv4Address()Ljava/lang/String;
    .locals 1

    .prologue
    .line 219
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv4:Ljava/lang/String;

    return-object v0
.end method

.method public getMulticastIPv6Address()Ljava/lang/String;
    .locals 1

    .prologue
    .line 237
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv6:Ljava/lang/String;

    return-object v0
.end method

.method public getSSDPBindAddress()[Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 202
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpBinds:[Ljava/net/InetAddress;

    return-object v0
.end method

.method public getSSDPPacket()Lorg/cybergarage/upnp/ssdp/SSDPPacket;
    .locals 1

    .prologue
    .line 249
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPacket:Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    return-object v0
.end method

.method public getSSDPPort()I
    .locals 1

    .prologue
    .line 178
    iget v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPort:I

    return v0
.end method

.method public getSSDPSearchSocketList()Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;
    .locals 5

    .prologue
    .line 156
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpSearchSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    if-nez v0, :cond_0

    .line 157
    new-instance v0, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    iget-object v1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpBinds:[Ljava/net/InetAddress;

    iget v2, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPort:I

    iget-object v3, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv4:Ljava/lang/String;

    iget-object v4, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv6:Ljava/lang/String;

    invoke-direct {v0, v1, v2, v3, v4}, Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;-><init>([Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpSearchSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    .line 159
    :cond_0
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpSearchSocketList:Lorg/cybergarage/upnp/ssdp/SSDPSearchSocketList;

    return-object v0
.end method

.method public setAdvertiser(Lorg/cybergarage/upnp/device/Advertiser;)V
    .locals 0
    .param p1, "adv"    # Lorg/cybergarage/upnp/device/Advertiser;

    .prologue
    .line 264
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->advertiser:Lorg/cybergarage/upnp/device/Advertiser;

    .line 265
    return-void
.end method

.method public setDescriptionFile(Ljava/io/File;)V
    .locals 0
    .param p1, "descriptionFile"    # Ljava/io/File;

    .prologue
    .line 55
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionFile:Ljava/io/File;

    .line 56
    return-void
.end method

.method public setDescriptionURI(Ljava/lang/String;)V
    .locals 0
    .param p1, "descriptionURI"    # Ljava/lang/String;

    .prologue
    .line 59
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->descriptionURI:Ljava/lang/String;

    .line 60
    return-void
.end method

.method public setHTTPBindAddress([Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "inets"    # [Ljava/net/InetAddress;

    .prologue
    .line 108
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpBinds:[Ljava/net/InetAddress;

    .line 109
    return-void
.end method

.method public setHTTPPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 126
    iput p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->httpPort:I

    .line 127
    return-void
.end method

.method public setLeaseTime(I)V
    .locals 0
    .param p1, "val"    # I

    .prologue
    .line 89
    iput p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->leaseTime:I

    .line 90
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 0
    .param p1, "location"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->location:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setMulticastIPv4Address(Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 211
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv4:Ljava/lang/String;

    .line 212
    return-void
.end method

.method public setMulticastIPv6Address(Ljava/lang/String;)V
    .locals 0
    .param p1, "ip"    # Ljava/lang/String;

    .prologue
    .line 228
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpMulticastIPv6:Ljava/lang/String;

    .line 229
    return-void
.end method

.method public setSSDPBindAddress([Ljava/net/InetAddress;)V
    .locals 0
    .param p1, "inets"    # [Ljava/net/InetAddress;

    .prologue
    .line 192
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpBinds:[Ljava/net/InetAddress;

    .line 193
    return-void
.end method

.method public setSSDPPacket(Lorg/cybergarage/upnp/ssdp/SSDPPacket;)V
    .locals 0
    .param p1, "packet"    # Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .prologue
    .line 253
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPacket:Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    .line 254
    return-void
.end method

.method public setSSDPPort(I)V
    .locals 0
    .param p1, "port"    # I

    .prologue
    .line 169
    iput p1, p0, Lorg/cybergarage/upnp/xml/DeviceData;->ssdpPort:I

    .line 170
    return-void
.end method
