.class public Lorg/cybergarage/util/ListenerList;
.super Ljava/util/Vector;
.source "ListenerList.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 21
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .locals 1
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 26
    invoke-virtual {p0, p1}, Lorg/cybergarage/util/ListenerList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    if-ltz v0, :cond_0

    .line 27
    const/4 v0, 0x0

    .line 28
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method
