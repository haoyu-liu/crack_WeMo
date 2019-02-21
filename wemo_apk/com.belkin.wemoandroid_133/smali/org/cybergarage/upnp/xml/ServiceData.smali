.class public Lorg/cybergarage/upnp/xml/ServiceData;
.super Lorg/cybergarage/upnp/xml/NodeData;
.source "ServiceData.java"


# instance fields
.field private controlActionListenerList:Lorg/cybergarage/util/ListenerList;

.field private descriptionURL:Ljava/lang/String;

.field private scpdNode:Lorg/cybergarage/xml/Node;

.field private sid:Ljava/lang/String;

.field private subscriberList:Lorg/cybergarage/upnp/event/SubscriberList;

.field private timeout:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 29
    invoke-direct {p0}, Lorg/cybergarage/upnp/xml/NodeData;-><init>()V

    .line 36
    new-instance v0, Lorg/cybergarage/util/ListenerList;

    invoke-direct {v0}, Lorg/cybergarage/util/ListenerList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->controlActionListenerList:Lorg/cybergarage/util/ListenerList;

    .line 46
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->scpdNode:Lorg/cybergarage/xml/Node;

    .line 60
    new-instance v0, Lorg/cybergarage/upnp/event/SubscriberList;

    invoke-direct {v0}, Lorg/cybergarage/upnp/event/SubscriberList;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->subscriberList:Lorg/cybergarage/upnp/event/SubscriberList;

    .line 70
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->descriptionURL:Ljava/lang/String;

    .line 84
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->sid:Ljava/lang/String;

    .line 98
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->timeout:J

    .line 30
    return-void
.end method


# virtual methods
.method public getControlActionListenerList()Lorg/cybergarage/util/ListenerList;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->controlActionListenerList:Lorg/cybergarage/util/ListenerList;

    return-object v0
.end method

.method public getDescriptionURL()Ljava/lang/String;
    .locals 1

    .prologue
    .line 73
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->descriptionURL:Ljava/lang/String;

    return-object v0
.end method

.method public getSCPDNode()Lorg/cybergarage/xml/Node;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->scpdNode:Lorg/cybergarage/xml/Node;

    return-object v0
.end method

.method public getSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 87
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->sid:Ljava/lang/String;

    return-object v0
.end method

.method public getSubscriberList()Lorg/cybergarage/upnp/event/SubscriberList;
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->subscriberList:Lorg/cybergarage/upnp/event/SubscriberList;

    return-object v0
.end method

.method public getTimeout()J
    .locals 2

    .prologue
    .line 102
    iget-wide v0, p0, Lorg/cybergarage/upnp/xml/ServiceData;->timeout:J

    return-wide v0
.end method

.method public setDescriptionURL(Ljava/lang/String;)V
    .locals 0
    .param p1, "descriptionURL"    # Ljava/lang/String;

    .prologue
    .line 77
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ServiceData;->descriptionURL:Ljava/lang/String;

    .line 78
    return-void
.end method

.method public setSCPDNode(Lorg/cybergarage/xml/Node;)V
    .locals 0
    .param p1, "node"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 53
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ServiceData;->scpdNode:Lorg/cybergarage/xml/Node;

    .line 54
    return-void
.end method

.method public setSID(Ljava/lang/String;)V
    .locals 0
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 91
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ServiceData;->sid:Ljava/lang/String;

    .line 92
    return-void
.end method

.method public setTimeout(J)V
    .locals 1
    .param p1, "value"    # J

    .prologue
    .line 107
    iput-wide p1, p0, Lorg/cybergarage/upnp/xml/ServiceData;->timeout:J

    .line 108
    return-void
.end method
