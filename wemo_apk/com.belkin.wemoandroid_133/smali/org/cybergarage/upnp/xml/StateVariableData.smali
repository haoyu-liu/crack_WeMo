.class public Lorg/cybergarage/upnp/xml/StateVariableData;
.super Lorg/cybergarage/upnp/xml/NodeData;
.source "StateVariableData.java"


# instance fields
.field private queryListener:Lorg/cybergarage/upnp/control/QueryListener;

.field private queryRes:Lorg/cybergarage/upnp/control/QueryResponse;

.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 26
    invoke-direct {p0}, Lorg/cybergarage/upnp/xml/NodeData;-><init>()V

    .line 33
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->value:Ljava/lang/String;

    .line 47
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryListener:Lorg/cybergarage/upnp/control/QueryListener;

    .line 61
    iput-object v1, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryRes:Lorg/cybergarage/upnp/control/QueryResponse;

    .line 27
    return-void
.end method


# virtual methods
.method public getQueryListener()Lorg/cybergarage/upnp/control/QueryListener;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryListener:Lorg/cybergarage/upnp/control/QueryListener;

    return-object v0
.end method

.method public getQueryResponse()Lorg/cybergarage/upnp/control/QueryResponse;
    .locals 1

    .prologue
    .line 65
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryRes:Lorg/cybergarage/upnp/control/QueryResponse;

    return-object v0
.end method

.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setQueryListener(Lorg/cybergarage/upnp/control/QueryListener;)V
    .locals 0
    .param p1, "queryListener"    # Lorg/cybergarage/upnp/control/QueryListener;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryListener:Lorg/cybergarage/upnp/control/QueryListener;

    .line 55
    return-void
.end method

.method public setQueryResponse(Lorg/cybergarage/upnp/control/QueryResponse;)V
    .locals 0
    .param p1, "res"    # Lorg/cybergarage/upnp/control/QueryResponse;

    .prologue
    .line 70
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->queryRes:Lorg/cybergarage/upnp/control/QueryResponse;

    .line 71
    return-void
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 40
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/StateVariableData;->value:Ljava/lang/String;

    .line 41
    return-void
.end method
