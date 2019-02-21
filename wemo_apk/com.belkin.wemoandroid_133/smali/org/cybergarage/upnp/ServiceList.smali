.class public Lorg/cybergarage/upnp/ServiceList;
.super Ljava/util/Vector;
.source "ServiceList.java"


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "serviceList"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 36
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 37
    return-void
.end method


# virtual methods
.method public getService(I)Lorg/cybergarage/upnp/Service;
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 45
    const/4 v0, 0x0

    .line 47
    .local v0, "obj":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/ServiceList;->get(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 50
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_0
    check-cast v0, Lorg/cybergarage/upnp/Service;

    return-object v0

    .line 49
    .restart local v0    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    goto :goto_0
.end method
