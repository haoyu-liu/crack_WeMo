.class public Lorg/cybergarage/upnp/ssdp/SSDPPacket;
.super Ljava/lang/Object;
.source "SSDPPacket.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private dgmPacket:Ljava/net/DatagramPacket;

.field private localAddr:Ljava/lang/String;

.field private notify:Z

.field public packetBytes:[B

.field private timeStamp:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 42
    const-class v0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>([BI)V
    .locals 2
    .param p1, "buf"    # [B
    .param p2, "length"    # I

    .prologue
    const/4 v1, 0x0

    .line 50
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->notify:Z

    .line 58
    iput-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->dgmPacket:Ljava/net/DatagramPacket;

    .line 69
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->localAddr:Ljava/lang/String;

    .line 122
    iput-object v1, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    .line 51
    new-instance v0, Ljava/net/DatagramPacket;

    invoke-direct {v0, p1, p2}, Ljava/net/DatagramPacket;-><init>([BI)V

    iput-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->dgmPacket:Ljava/net/DatagramPacket;

    .line 52
    return-void
.end method


# virtual methods
.method public getCacheControl()Ljava/lang/String;
    .locals 2

    .prologue
    .line 148
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "Cache-Control"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getData()[B
    .locals 5

    .prologue
    .line 126
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    if-eqz v3, :cond_0

    .line 127
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    .line 134
    :goto_0
    return-object v3

    .line 129
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v0

    .line 130
    .local v0, "packet":Ljava/net/DatagramPacket;
    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getLength()I

    move-result v2

    .line 131
    .local v2, "packetLen":I
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getData()[B

    move-result-object v3

    const/4 v4, 0x0

    invoke-direct {v1, v3, v4, v2}, Ljava/lang/String;-><init>([BII)V

    .line 132
    .local v1, "packetData":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    iput-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    .line 134
    iget-object v3, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->packetBytes:[B

    goto :goto_0
.end method

.method public getDatagramPacket()Ljava/net/DatagramPacket;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->dgmPacket:Ljava/net/DatagramPacket;

    return-object v0
.end method

.method public getHost()Ljava/lang/String;
    .locals 2

    .prologue
    .line 143
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "HOST"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHostInetAddress()Ljava/net/InetAddress;
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 197
    const-string v0, "127.0.0.1"

    .line 198
    .local v0, "addrStr":Ljava/lang/String;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getHost()Ljava/lang/String;

    move-result-object v2

    .line 199
    .local v2, "host":Ljava/lang/String;
    const-string v4, ":"

    invoke-virtual {v2, v4}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    .line 200
    .local v1, "canmaIdx":I
    if-ltz v1, :cond_1

    .line 201
    invoke-virtual {v2, v6, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 202
    invoke-virtual {v0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x5b

    if-ne v4, v5, :cond_0

    .line 203
    const/4 v4, 0x1

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 204
    :cond_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v5, 0x5d

    if-ne v4, v5, :cond_1

    .line 205
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    invoke-virtual {v0, v6, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 207
    :cond_1
    new-instance v3, Ljava/net/InetSocketAddress;

    invoke-direct {v3, v0, v6}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    .line 208
    .local v3, "isockaddr":Ljava/net/InetSocketAddress;
    invoke-virtual {v3}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    return-object v4
.end method

.method public getLeaseTime()I
    .locals 1

    .prologue
    .line 242
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getCacheControl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->getLeaseTime(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getLocalAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->localAddr:Ljava/lang/String;

    return-object v0
.end method

.method public getLocation()Ljava/lang/String;
    .locals 2

    .prologue
    .line 153
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "Location"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMAN()Ljava/lang/String;
    .locals 2

    .prologue
    .line 158
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "MAN"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMX()I
    .locals 2

    .prologue
    .line 188
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "MX"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getIntegerValue([BLjava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getNT()Ljava/lang/String;
    .locals 2

    .prologue
    .line 168
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "NT"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNTS()Ljava/lang/String;
    .locals 2

    .prologue
    .line 173
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "NTS"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteAddress()Ljava/lang/String;
    .locals 1

    .prologue
    .line 110
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getRemoteInetAddress()Ljava/net/InetAddress;
    .locals 1

    .prologue
    .line 104
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getAddress()Ljava/net/InetAddress;

    move-result-object v0

    return-object v0
.end method

.method public getRemotePort()I
    .locals 1

    .prologue
    .line 115
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getDatagramPacket()Ljava/net/DatagramPacket;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/DatagramPacket;->getPort()I

    move-result v0

    return v0
.end method

.method public getST()Ljava/lang/String;
    .locals 2

    .prologue
    .line 163
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "ST"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getServer()Ljava/lang/String;
    .locals 2

    .prologue
    .line 178
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "Server"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimeStamp()J
    .locals 2

    .prologue
    .line 95
    iget-wide v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->timeStamp:J

    return-wide v0
.end method

.method public getUSN()Ljava/lang/String;
    .locals 2

    .prologue
    .line 183
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v0

    const-string v1, "USN"

    invoke-static {v0, v1}, Lorg/cybergarage/http/HTTPHeader;->getValue([BLjava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isAlive()Z
    .locals 1

    .prologue
    .line 232
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getNTS()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/device/NTS;->isAlive(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isByeBye()Z
    .locals 1

    .prologue
    .line 237
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getNTS()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/device/NTS;->isByeBye(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isDiscover()Z
    .locals 1

    .prologue
    .line 227
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getMAN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/device/MAN;->isDiscover(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public isNotify()Z
    .locals 1

    .prologue
    .line 245
    iget-boolean v0, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->notify:Z

    return v0
.end method

.method public isRootDevice()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 217
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getNT()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/cybergarage/upnp/device/NT;->isRootDevice(Ljava/lang/String;)Z

    move-result v1

    if-ne v1, v0, :cond_1

    .line 222
    :cond_0
    :goto_0
    return v0

    .line 220
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getST()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lorg/cybergarage/upnp/device/ST;->isRootDevice(Ljava/lang/String;)Z

    move-result v1

    if-eq v1, v0, :cond_0

    .line 222
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getUSN()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/device/USN;->isRootDevice(Ljava/lang/String;)Z

    move-result v0

    goto :goto_0
.end method

.method public setLocalAddress(Ljava/lang/String;)V
    .locals 0
    .param p1, "addr"    # Ljava/lang/String;

    .prologue
    .line 73
    iput-object p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->localAddr:Ljava/lang/String;

    .line 74
    return-void
.end method

.method public setNotify(Z)V
    .locals 3
    .param p1, "notify"    # Z

    .prologue
    .line 248
    sget-object v0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery: SSDP Packet settinf NOTIFY Flag to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 249
    iput-boolean p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->notify:Z

    .line 250
    return-void
.end method

.method public setTimeStamp(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 90
    iput-wide p1, p0, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->timeStamp:J

    .line 91
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 257
    new-instance v0, Ljava/lang/String;

    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPPacket;->getData()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    return-object v0
.end method
