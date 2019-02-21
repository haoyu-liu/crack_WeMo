.class public Lorg/cybergarage/upnp/event/PropertyList;
.super Ljava/util/Vector;
.source "PropertyList.java"


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "PropertyList"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 34
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 35
    return-void
.end method


# virtual methods
.method public getProperty(I)Lorg/cybergarage/upnp/event/Property;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/event/PropertyList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/event/Property;

    return-object v0
.end method
