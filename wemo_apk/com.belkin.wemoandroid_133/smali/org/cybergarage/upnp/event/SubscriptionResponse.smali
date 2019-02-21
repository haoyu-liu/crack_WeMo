.class public Lorg/cybergarage/upnp/event/SubscriptionResponse;
.super Lorg/cybergarage/http/HTTPResponse;
.source "SubscriptionResponse.java"


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/cybergarage/http/HTTPResponse;-><init>()V

    .line 30
    invoke-static {}, Lorg/cybergarage/upnp/UPnP;->getServerName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setServer(Ljava/lang/String;)V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/http/HTTPResponse;)V
    .locals 0
    .param p1, "httpRes"    # Lorg/cybergarage/http/HTTPResponse;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/cybergarage/http/HTTPResponse;-><init>(Lorg/cybergarage/http/HTTPResponse;)V

    .line 36
    return-void
.end method


# virtual methods
.method public getSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 69
    const-string v0, "SID"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/event/Subscription;->getSID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getTimeout()J
    .locals 2

    .prologue
    .line 83
    const-string v0, "TIMEOUT"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/event/Subscription;->getTimeout(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public setErrorResponse(I)V
    .locals 2
    .param p1, "code"    # I

    .prologue
    .line 54
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setStatusCode(I)V

    .line 55
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setContentLength(J)V

    .line 56
    return-void
.end method

.method public setResponse(I)V
    .locals 2
    .param p1, "code"    # I

    .prologue
    .line 44
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setStatusCode(I)V

    .line 45
    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setContentLength(J)V

    .line 46
    return-void
.end method

.method public setSID(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 64
    const-string v0, "SID"

    invoke-static {p1}, Lorg/cybergarage/upnp/event/Subscription;->toSIDHeaderString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    return-void
.end method

.method public setTimeout(J)V
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 78
    const-string v0, "TIMEOUT"

    invoke-static {p1, p2}, Lorg/cybergarage/upnp/event/Subscription;->toTimeoutHeaderString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/SubscriptionResponse;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    return-void
.end method
