.class public Lorg/cybergarage/upnp/xml/ArgumentData;
.super Lorg/cybergarage/upnp/xml/NodeData;
.source "ArgumentData.java"


# instance fields
.field private value:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 21
    invoke-direct {p0}, Lorg/cybergarage/upnp/xml/NodeData;-><init>()V

    .line 28
    const-string v0, ""

    iput-object v0, p0, Lorg/cybergarage/upnp/xml/ArgumentData;->value:Ljava/lang/String;

    .line 22
    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/String;
    .locals 1

    .prologue
    .line 32
    iget-object v0, p0, Lorg/cybergarage/upnp/xml/ArgumentData;->value:Ljava/lang/String;

    return-object v0
.end method

.method public setValue(Ljava/lang/String;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 37
    iput-object p1, p0, Lorg/cybergarage/upnp/xml/ArgumentData;->value:Ljava/lang/String;

    .line 38
    return-void
.end method
