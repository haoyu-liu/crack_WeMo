.class public Lorg/cybergarage/upnp/IconList;
.super Ljava/util/Vector;
.source "IconList.java"


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "iconList"


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
.method public getIcon(I)Lorg/cybergarage/upnp/Icon;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 43
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/IconList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Icon;

    return-object v0
.end method
