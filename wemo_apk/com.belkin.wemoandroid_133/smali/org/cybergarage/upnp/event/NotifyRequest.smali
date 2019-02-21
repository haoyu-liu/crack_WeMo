.class public Lorg/cybergarage/upnp/event/NotifyRequest;
.super Lorg/cybergarage/soap/SOAPRequest;
.source "NotifyRequest.java"


# static fields
.field private static final PROPERTY:Ljava/lang/String; = "property"

.field private static final PROPERTYSET:Ljava/lang/String; = "propertyset"

.field private static final XMLNS:Ljava/lang/String; = "e"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Lorg/cybergarage/soap/SOAPRequest;-><init>()V

    .line 61
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/http/HTTPRequest;)V
    .locals 0
    .param p1, "httpReq"    # Lorg/cybergarage/http/HTTPRequest;

    .prologue
    .line 64
    invoke-direct {p0}, Lorg/cybergarage/soap/SOAPRequest;-><init>()V

    .line 65
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/event/NotifyRequest;->set(Lorg/cybergarage/http/HTTPRequest;)V

    .line 66
    return-void
.end method

.method private createPropertySetNode(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/xml/Node;
    .locals 5
    .param p1, "varName"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 145
    new-instance v1, Lorg/cybergarage/xml/Node;

    const-string v3, "propertyset"

    invoke-direct {v1, v3}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 147
    .local v1, "propSetNode":Lorg/cybergarage/xml/Node;
    const-string v3, "e"

    const-string v4, "urn:schemas-upnp-org:event-1-0"

    invoke-virtual {v1, v3, v4}, Lorg/cybergarage/xml/Node;->setNameSpace(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    new-instance v0, Lorg/cybergarage/xml/Node;

    const-string v3, "property"

    invoke-direct {v0, v3}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 150
    .local v0, "propNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v1, v0}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 154
    new-instance v2, Lorg/cybergarage/xml/Node;

    invoke-direct {v2, p1}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 155
    .local v2, "varNameNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v2, p2}, Lorg/cybergarage/xml/Node;->setValue(Ljava/lang/String;)V

    .line 156
    invoke-virtual {v0, v2}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 158
    return-object v1
.end method

.method private getProperty(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/event/Property;
    .locals 6
    .param p1, "varNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 178
    new-instance v1, Lorg/cybergarage/upnp/event/Property;

    invoke-direct {v1}, Lorg/cybergarage/upnp/event/Property;-><init>()V

    .line 179
    .local v1, "prop":Lorg/cybergarage/upnp/event/Property;
    if-nez p1, :cond_0

    .line 196
    :goto_0
    return-object v1

    .line 182
    :cond_0
    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v2

    .line 183
    .local v2, "variableName":Ljava/lang/String;
    const/16 v3, 0x3a

    invoke-virtual {v2, v3}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    .line 184
    .local v0, "index":I
    const/4 v3, -0x1

    if-eq v0, v3, :cond_1

    .line 185
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 187
    :cond_1
    const-string v3, "StatusChange"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_2

    const-string v3, "StatusChange"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 188
    sget-object v3, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "VARNAODE*******"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getValue()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "---"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getParentNode()Lorg/cybergarage/xml/Node;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "---"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 189
    const/4 v3, 0x1

    invoke-virtual {p1, v3}, Lorg/cybergarage/xml/Node;->setValue(I)V

    .line 190
    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/event/Property;->setValue(Ljava/lang/String;)V

    .line 191
    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/event/Property;->setName(Ljava/lang/String;)V

    goto :goto_0

    .line 193
    :cond_2
    invoke-virtual {p1}, Lorg/cybergarage/xml/Node;->getValue()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/event/Property;->setValue(Ljava/lang/String;)V

    .line 194
    invoke-virtual {v1, v2}, Lorg/cybergarage/upnp/event/Property;->setName(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private getVariableNode()Lorg/cybergarage/xml/Node;
    .locals 5

    .prologue
    const/4 v4, 0x0

    const/4 v2, 0x0

    .line 164
    invoke-virtual {p0}, Lorg/cybergarage/upnp/event/NotifyRequest;->getEnvelopeNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 165
    .local v1, "rootNode":Lorg/cybergarage/xml/Node;
    if-nez v1, :cond_1

    .line 172
    :cond_0
    :goto_0
    return-object v2

    .line 167
    :cond_1
    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 169
    invoke-virtual {v1, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 170
    .local v0, "propNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->hasNodes()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 172
    invoke-virtual {v0, v4}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    goto :goto_0
.end method


# virtual methods
.method public getPropertyList()Lorg/cybergarage/upnp/event/PropertyList;
    .locals 6

    .prologue
    .line 202
    new-instance v3, Lorg/cybergarage/upnp/event/PropertyList;

    invoke-direct {v3}, Lorg/cybergarage/upnp/event/PropertyList;-><init>()V

    .line 203
    .local v3, "properties":Lorg/cybergarage/upnp/event/PropertyList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/event/NotifyRequest;->getEnvelopeNode()Lorg/cybergarage/xml/Node;

    move-result-object v4

    .line 206
    .local v4, "varSetNode":Lorg/cybergarage/xml/Node;
    if-eqz v4, :cond_1

    .line 207
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v4}, Lorg/cybergarage/xml/Node;->getNNodes()I

    move-result v5

    if-ge v0, v5, :cond_2

    .line 208
    invoke-virtual {v4, v0}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 209
    .local v2, "propNode":Lorg/cybergarage/xml/Node;
    if-nez v2, :cond_0

    .line 207
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 211
    :cond_0
    const/4 v5, 0x0

    invoke-virtual {v2, v5}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v5

    invoke-direct {p0, v5}, Lorg/cybergarage/upnp/event/NotifyRequest;->getProperty(Lorg/cybergarage/xml/Node;)Lorg/cybergarage/upnp/event/Property;

    move-result-object v1

    .line 212
    .local v1, "prop":Lorg/cybergarage/upnp/event/Property;
    invoke-virtual {v3, v1}, Lorg/cybergarage/upnp/event/PropertyList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 217
    .end local v0    # "i":I
    .end local v1    # "prop":Lorg/cybergarage/upnp/event/Property;
    .end local v2    # "propNode":Lorg/cybergarage/xml/Node;
    :cond_1
    const/4 v3, 0x0

    .end local v3    # "properties":Lorg/cybergarage/upnp/event/PropertyList;
    :cond_2
    return-object v3
.end method

.method public getSEQ()J
    .locals 2

    .prologue
    .line 111
    const-string v0, "SEQ"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/event/NotifyRequest;->getLongHeaderValue(Ljava/lang/String;)J

    move-result-wide v0

    return-wide v0
.end method

.method public getSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 97
    const-string v0, "SID"

    invoke-virtual {p0, v0}, Lorg/cybergarage/upnp/event/NotifyRequest;->getHeaderValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lorg/cybergarage/upnp/event/Subscription;->getSID(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public setNT(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 74
    const-string v0, "NT"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/event/NotifyRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public setNTS(Ljava/lang/String;)V
    .locals 1
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 83
    const-string v0, "NTS"

    invoke-virtual {p0, v0, p1}, Lorg/cybergarage/upnp/event/NotifyRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    return-void
.end method

.method public setRequest(Lorg/cybergarage/upnp/event/Subscriber;Ljava/lang/String;Ljava/lang/String;)Z
    .locals 9
    .param p1, "sub"    # Lorg/cybergarage/upnp/event/Subscriber;
    .param p2, "varName"    # Ljava/lang/String;
    .param p3, "value"    # Ljava/lang/String;

    .prologue
    .line 121
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getDeliveryURL()Ljava/lang/String;

    move-result-object v0

    .line 122
    .local v0, "callback":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getSID()Ljava/lang/String;

    move-result-object v7

    .line 123
    .local v7, "sid":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getNotifyCount()J

    move-result-wide v2

    .line 124
    .local v2, "notifyCnt":J
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getDeliveryHost()Ljava/lang/String;

    move-result-object v1

    .line 125
    .local v1, "host":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getDeliveryPath()Ljava/lang/String;

    move-result-object v4

    .line 126
    .local v4, "path":Ljava/lang/String;
    invoke-virtual {p1}, Lorg/cybergarage/upnp/event/Subscriber;->getDeliveryPort()I

    move-result v5

    .line 128
    .local v5, "port":I
    const-string v8, "NOTIFY"

    invoke-virtual {p0, v8}, Lorg/cybergarage/upnp/event/NotifyRequest;->setMethod(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/event/NotifyRequest;->setURI(Ljava/lang/String;)V

    .line 130
    invoke-virtual {p0, v1, v5}, Lorg/cybergarage/upnp/event/NotifyRequest;->setHost(Ljava/lang/String;I)V

    .line 131
    const-string v8, "upnp:event"

    invoke-virtual {p0, v8}, Lorg/cybergarage/upnp/event/NotifyRequest;->setNT(Ljava/lang/String;)V

    .line 132
    const-string v8, "upnp:propchange"

    invoke-virtual {p0, v8}, Lorg/cybergarage/upnp/event/NotifyRequest;->setNTS(Ljava/lang/String;)V

    .line 133
    invoke-virtual {p0, v7}, Lorg/cybergarage/upnp/event/NotifyRequest;->setSID(Ljava/lang/String;)V

    .line 134
    invoke-virtual {p0, v2, v3}, Lorg/cybergarage/upnp/event/NotifyRequest;->setSEQ(J)V

    .line 136
    const-string v8, "text/xml; charset=\"utf-8\""

    invoke-virtual {p0, v8}, Lorg/cybergarage/upnp/event/NotifyRequest;->setContentType(Ljava/lang/String;)V

    .line 137
    invoke-direct {p0, p2, p3}, Lorg/cybergarage/upnp/event/NotifyRequest;->createPropertySetNode(Ljava/lang/String;Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v6

    .line 138
    .local v6, "propSetNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0, v6}, Lorg/cybergarage/upnp/event/NotifyRequest;->setContent(Lorg/cybergarage/xml/Node;)V

    .line 140
    const/4 v8, 0x1

    return v8
.end method

.method public setSEQ(J)V
    .locals 3
    .param p1, "value"    # J

    .prologue
    .line 106
    const-string v0, "SEQ"

    invoke-static {p1, p2}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/NotifyRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    return-void
.end method

.method public setSID(Ljava/lang/String;)V
    .locals 2
    .param p1, "id"    # Ljava/lang/String;

    .prologue
    .line 92
    const-string v0, "SID"

    invoke-static {p1}, Lorg/cybergarage/upnp/event/Subscription;->toSIDHeaderString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/event/NotifyRequest;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    .line 93
    return-void
.end method
