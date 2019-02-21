.class public Lorg/cybergarage/upnp/control/QueryResponse;
.super Lorg/cybergarage/upnp/control/ControlResponse;
.source "QueryResponse.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Lorg/cybergarage/upnp/control/ControlResponse;-><init>()V

    .line 31
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/soap/SOAPResponse;)V
    .locals 0
    .param p1, "soapRes"    # Lorg/cybergarage/soap/SOAPResponse;

    .prologue
    .line 35
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/control/ControlResponse;-><init>(Lorg/cybergarage/soap/SOAPResponse;)V

    .line 36
    return-void
.end method

.method private createResponseNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;
    .locals 4
    .param p1, "var"    # Ljava/lang/String;

    .prologue
    .line 86
    new-instance v0, Lorg/cybergarage/xml/Node;

    invoke-direct {v0}, Lorg/cybergarage/xml/Node;-><init>()V

    .line 87
    .local v0, "queryResNode":Lorg/cybergarage/xml/Node;
    const-string v2, "u"

    const-string v3, "QueryStateVariableResponse"

    invoke-virtual {v0, v2, v3}, Lorg/cybergarage/xml/Node;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 88
    const-string v2, "u"

    const-string v3, "urn:schemas-upnp-org:control-1-0"

    invoke-virtual {v0, v2, v3}, Lorg/cybergarage/xml/Node;->setNameSpace(Ljava/lang/String;Ljava/lang/String;)V

    .line 90
    new-instance v1, Lorg/cybergarage/xml/Node;

    invoke-direct {v1}, Lorg/cybergarage/xml/Node;-><init>()V

    .line 91
    .local v1, "returnNode":Lorg/cybergarage/xml/Node;
    const-string v2, "return"

    invoke-virtual {v1, v2}, Lorg/cybergarage/xml/Node;->setName(Ljava/lang/String;)V

    .line 92
    invoke-virtual {v1, p1}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 93
    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 95
    return-object v0
.end method

.method private getReturnNode()Lorg/cybergarage/xml/Node;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 44
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryResponse;->getBodyNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 45
    .local v0, "bodyNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_1

    .line 54
    :cond_0
    :goto_0
    return-object v2

    .line 47
    :cond_1
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 49
    invoke-virtual {v0, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 50
    .local v1, "queryResNode":Lorg/cybergarage/xml/Node;
    if-eqz v1, :cond_0

    .line 52
    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    invoke-virtual {v1, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public getReturnValue()Ljava/lang/String;
    .locals 2

    .prologue
    .line 59
    invoke-direct {p0}, Lorg/cybergarage/upnp/control/QueryResponse;->getReturnNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 60
    .local v0, "node":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_0

    .line 61
    const-string v1, ""

    .line 62
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public setResponse(Lorg/cybergarage/upnp/StateVariable;)V
    .locals 5
    .param p1, "stateVar"    # Lorg/cybergarage/upnp/StateVariable;

    .prologue
    .line 71
    invoke-virtual {p1}, Lorg/cybergarage/upnp/StateVariable;->getValue()Ljava/lang/String;

    move-result-object v3

    .line 73
    .local v3, "var":Ljava/lang/String;
    const/16 v4, 0xc8

    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/control/QueryResponse;->setStatusCode(I)V

    .line 75
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryResponse;->getBodyNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 76
    .local v0, "bodyNode":Lorg/cybergarage/xml/Node;
    invoke-direct {p0, v3}, Lorg/cybergarage/upnp/control/QueryResponse;->createResponseNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 77
    .local v2, "resNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v0, v2}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 79
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryResponse;->getEnvelopeNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 80
    .local v1, "envNodee":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/control/QueryResponse;->setContent(Lorg/cybergarage/xml/Node;)V

    .line 82
    return-void
.end method
