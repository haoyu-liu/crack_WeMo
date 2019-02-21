.class public Lorg/cybergarage/upnp/event/SubscriberList;
.super Ljava/util/Vector;
.source "SubscriberList.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 30
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 31
    return-void
.end method


# virtual methods
.method public getSubscriber(I)Lorg/cybergarage/upnp/event/Subscriber;
    .locals 2
    .param p1, "n"    # I

    .prologue
    .line 39
    const/4 v0, 0x0

    .line 41
    .local v0, "obj":Ljava/lang/Object;
    :try_start_0
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/event/SubscriberList;->get(I)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 44
    .end local v0    # "obj":Ljava/lang/Object;
    :goto_0
    check-cast v0, Lorg/cybergarage/upnp/event/Subscriber;

    return-object v0

    .line 43
    .restart local v0    # "obj":Ljava/lang/Object;
    :catch_0
    move-exception v1

    goto :goto_0
.end method
