.class public Lorg/cybergarage/upnp/xml/ActionData;
.super Lorg/cybergarage/upnp/xml/NodeData;
.source "ActionData.java"


# instance fields
.field private actionListener:Lorg/cybergarage/upnp/control/ActionListener;

.field private ctrlRes:Lorg/cybergarage/upnp/control/ControlResponse;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0}, Lorg/cybergarage/upnp/xml/NodeData;-><init>()V

    .line 31
    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ActionData;->actionListener:Lorg/cybergarage/upnp/control/ActionListener;

    .line 45
    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ActionData;->ctrlRes:Lorg/cybergarage/upnp/control/ControlResponse;

    .line 25
    return-void
.end method


# virtual methods
.method public getActionListener()Lorg/cybergarage/upnp/control/ActionListener;
    .locals 1

    .prologue
    .line 34
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ActionData;->actionListener:Lorg/cybergarage/upnp/control/ActionListener;

    return-object v0
.end method

.method public getControlResponse()Lorg/cybergarage/upnp/control/ControlResponse;
    .locals 1

    .prologue
    .line 49
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ActionData;->ctrlRes:Lorg/cybergarage/upnp/control/ControlResponse;

    return-object v0
.end method

.method public setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V
    .locals 0
    .param p1, "actionListener"    # Lorg/cybergarage/upnp/control/ActionListener;

    .prologue
    .line 38
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ActionData;->actionListener:Lorg/cybergarage/upnp/control/ActionListener;

    .line 39
    return-void
.end method

.method public setControlResponse(Lorg/cybergarage/upnp/control/ControlResponse;)V
    .locals 0
    .param p1, "res"    # Lorg/cybergarage/upnp/control/ControlResponse;

    .prologue
    .line 54
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ActionData;->ctrlRes:Lorg/cybergarage/upnp/control/ControlResponse;

    .line 55
    return-void
.end method
