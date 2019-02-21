.class public Lorg/cybergarage/upnp/control/QueryRequest;
.super Lorg/cybergarage/upnp/control/ControlRequest;
.source "QueryRequest.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 35
    invoke-direct {p0}, Lorg/cybergarage/upnp/control/ControlRequest;-><init>()V

    .line 36
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 0
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 39
    invoke-direct {p0}, Lorg/cybergarage/upnp/control/ControlRequest;-><init>()V

    .line 40
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/control/QueryRequest;->set(Lorg/cybergarage/http/HTTPRequest;)V

    .line 41
    return-void
.end method

.method private createContentNode(Lorg/cybergarage/upnp/StateVariable;)Lorg/cybergarage/xml/Node;
    .locals 4
    .param p1, "stateVar"    # Lorg/cybergarage/upnp/StateVariable;

    .prologue
    .line 99
    new-instance v0, Lorg/cybergarage/xml/Node;

    invoke-direct {v0}, Lorg/cybergarage/xml/Node;-><init>()V

    .line 100
    .local v0, "queryVarNode":Lorg/cybergarage/xml/Node;
    const-string v2, "u"

    const-string v3, "QueryStateVariable"

    invoke-virtual {v0, v2, v3}, Lorg/cybergarage/xml/Node;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const-string v2, "u"

    const-string v3, "urn:schemas-upnp-org:control-1-0"

    invoke-virtual {v0, v2, v3}, Lorg/cybergarage/xml/Node;->setNameSpace(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    new-instance v1, Lorg/cybergarage/xml/Node;

    invoke-direct {v1}, Lorg/cybergarage/xml/Node;-><init>()V

    .line 104
    .local v1, "varNode":Lorg/cybergarage/xml/Node;
    const-string v2, "u"

    const-string v3, "varName"

    invoke-virtual {v1, v2, v3}, Lorg/cybergarage/xml/Node;->setName(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    invoke-virtual {p1}, Lorg/cybergarage/upnp/StateVariable;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 108
    return-object v0
.end method

.method private getVarNameNode()Lorg/cybergarage/xml/Node;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 49
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getBodyNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 50
    .local v0, "bodyNode":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_1

    .line 59
    :cond_0
    :goto_0
    return-object v2

    .line 52
    :cond_1
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    invoke-virtual {v0, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 55
    .local v1, "queryStateVarNode":Lorg/cybergarage/xml/Node;
    if-eqz v1, :cond_0

    .line 57
    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 59
    invoke-virtual {v1, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public getVarName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getVarNameNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 65
    .local v0, "node":Lorg/cybergarage/xml/Node;
    if-nez v0, :cond_0

    .line 66
    const-string v1, ""

    .line 67
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public post(II)Lorg/cybergarage/upnp/control/QueryResponse;
    .locals 3
    .param p1, "soTimeout"    # I
    .param p2, "connectionTimeout"    # I

    .prologue
    .line 117
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getRequestHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getRequestPort()I

    move-result v2

    invoke-virtual {p0, v1, v2, p1, p2}, Lorg/cybergarage/upnp/control/QueryRequest;->postMessage(Ljava/lang/String;III)Lorg/cybergarage/soap/SOAPResponse;

    move-result-object v0

    .line 118
    .local v0, "soapRes":Lorg/cybergarage/soap/SOAPResponse;
    new-instance v1, Lorg/cybergarage/upnp/control/QueryResponse;

    invoke-direct {v1, v0}, Lorg/cybergarage/upnp/control/QueryResponse;-><init>(Lorg/cybergarage/soap/SOAPResponse;)V

    return-object v1
.end method

.method public setRequest(Lorg/cybergarage/upnp/StateVariable;)V
    .locals 6
    .param p1, "stateVar"    # Lorg/cybergarage/upnp/StateVariable;

    .prologue
    .line 76
    invoke-virtual {p1}, Lorg/cybergarage/upnp/StateVariable;->getService()Lorg/cybergarage/upnp/Service;

    move-result-object v4

    .line 79
    .local v4, "service":Lorg/cybergarage/upnp/Service;
    invoke-virtual {v4}, Lorg/cybergarage/upnp/Service;->getControlURL()Ljava/lang/String;

    move-result-object v1

    .line 81
    .local v1, "ctrlURL":Ljava/lang/String;
    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/control/QueryRequest;->setRequestHost(Lorg/cybergarage/upnp/Service;)V

    .line 83
    invoke-static {}, Lorg/cybergarage/soap/SOAP;->createEnvelopeBodyNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/control/QueryRequest;->setEnvelopeNode(Lorg/cybergarage/xml/Node;)V

    .line 84
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getEnvelopeNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 85
    .local v2, "envNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/control/QueryRequest;->getBodyNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 86
    .local v0, "bodyNode":Lorg/cybergarage/xml/Node;
    invoke-direct {p0, p1}, Lorg/cybergarage/upnp/control/QueryRequest;->createContentNode(Lorg/cybergarage/upnp/StateVariable;)Lorg/cybergarage/xml/Node;

    move-result-object v3

    .line 87
    .local v3, "qeuryNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v0, v3}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 88
    invoke-virtual {p0, v2}, Lorg/cybergarage/upnp/control/QueryRequest;->setContent(Lorg/cybergarage/xml/Node;)V

    .line 90
    const-string v5, "urn:schemas-upnp-org:control-1-0#QueryStateVariable"

    invoke-virtual {p0, v5}, Lorg/cybergarage/upnp/control/QueryRequest;->setSOAPAction(Ljava/lang/String;)V

    .line 91
    return-void
.end method
