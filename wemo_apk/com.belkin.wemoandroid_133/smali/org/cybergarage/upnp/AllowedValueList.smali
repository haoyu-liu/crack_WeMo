.class public Lorg/cybergarage/upnp/AllowedValueList;
.super Ljava/util/Vector;
.source "AllowedValueList.java"


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "allowedValueList"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 39
    return-void
.end method

.method public constructor <init>([Ljava/lang/String;)V
    .locals 3
    .param p1, "values"    # [Ljava/lang/String;

    .prologue
    .line 42
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 43
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    .line 44
    new-instance v1, Lorg/cybergarage/upnp/AllowedValue;

    aget-object v2, p1, v0

    invoke-direct {v1, v2}, Lorg/cybergarage/upnp/AllowedValue;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lorg/cybergarage/upnp/AllowedValueList;->add(Ljava/lang/Object;)Z

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method


# virtual methods
.method public getAllowedValue(I)Lorg/cybergarage/upnp/AllowedValue;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 56
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/AllowedValueList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/AllowedValue;

    return-object v0
.end method

.method public isAllowed(Ljava/lang/String;)Z
    .locals 3
    .param p1, "v"    # Ljava/lang/String;

    .prologue
    .line 60
    invoke-virtual {p0}, Lorg/cybergarage/upnp/AllowedValueList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i":Ljava/util/Iterator;
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 61
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/AllowedValue;

    .line 62
    .local v0, "av":Lorg/cybergarage/upnp/AllowedValue;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/AllowedValue;->getValue()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 63
    const/4 v2, 0x1

    .line 65
    .end local v0    # "av":Lorg/cybergarage/upnp/AllowedValue;
    :goto_0
    return v2

    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method
