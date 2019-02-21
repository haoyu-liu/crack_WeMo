.class public Lorg/cybergarage/upnp/ssdp/SSDPResponse;
.super Lorg/cybergarage/http/HTTPResponse;
.source "SSDPResponse.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/cybergarage/http/HTTPResponse;-><init>()V

    .line 40
    const-string v0, "1.1"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setVersion(Ljava/lang/String;)V

    .line 41
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 0
    .param p1, "in"    # Ljava/io/InputStream;

    .prologue
    .line 45
    invoke-direct {p0, p1}, Lorg/cybergarage/http/HTTPResponse;-><init>(Ljava/io/InputStream;)V

    .line 46
    return-void
.end method


# virtual methods
.method public getHeader()Ljava/lang/String;
    .locals 2

    .prologue
    .line 125
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    .line 127
    .local v0, "str":Ljava/lang/StringBuffer;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getStatusLineString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 128
    invoke-virtual {p0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 129
    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 131
    invoke-virtual {v0}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public getLeaseTime()I
    .locals 2

    .prologue
    .line 115
    const-string v1, "Cache-Control"

    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 116
    .local v0, "cacheCtrl":Ljava/lang/String;
    invoke-static {v0}, Lorg/cybergarage/upnp/ssdp/SSDP;->getLeaseTime(Ljava/lang/String;)I

    move-result v1

    return v1
.end method

.method public getLocation()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    const-string v0, "Location"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getMYNAME()Ljava/lang/String;
    .locals 1

    .prologue
    .line 101
    const-string v0, "MYNAME"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getST()Ljava/lang/String;
    .locals 1

    .prologue
    .line 59
    const-string v0, "ST"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getUSN()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    const-string v0, "USN"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setLeaseTime(I)V
    .locals 3
    .param p1, "len"    # I

    .prologue
    .line 110
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

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    return-void
.end method

.method public setLocation(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 68
    const-string v0, "Location"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    return-void
.end method

.method public setMYNAME(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 96
    const-string v0, "MYNAME"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    return-void
.end method

.method public setST(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 54
    const-string v0, "ST"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    return-void
.end method

.method public setUSN(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 82
    const-string v0, "USN"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/ssdp/SSDPResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    return-void
.end method
