.class public Lorg/cybergarage/upnp/ssdp/SSDPRequest;
.super Lorg/cybergarage/http/HTTPRequest;
.source "SSDPRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 33
    invoke-direct {p0}, Lorg/cybergarage/http/HTTPRequest;-><init>()V

    .line 34
    const-string v0, "1.1"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setVersion(Ljava/lang/String;)V

    .line 35
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 39
    invoke-direct {p0, p1}, Lorg/cybergarage/http/HTTPRequest;-><init>(Ljava/io/InputStream;)V

    .line 40
    return-void
.end method


# virtual methods
.method public getLeaseTime()I
    .locals 2

    .prologue
    .line 109
    const-string v1, "Cache-Control"

    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "cacheCtrl":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->getLeaseTime(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 81
    const-string v0, "Location"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNT()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    const-string v0, "NT"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getNTS()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    const-string v0, "NTS"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUSN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    const-string v0, "USN"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setLeaseTime(I)V
    .locals 3
    .param p1, "len"    # I

    .prologue
    .line 104
    const-string v0, "Cache-Control"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "max-age="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 76
    const-string v0, "Location"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    return-void
.end method

.method public setNT(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 48
    const-string v0, "NT"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method public setNTS(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 62
    const-string v0, "NTS"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    return-void
.end method

.method public setUSN(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 90
    const-string v0, "USN"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    return-void
.end method
