.class public Lorg/cybergarage/http/ParameterList;
.super Ljava/util/Vector;
.source "ParameterList.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Ljava/util/Vector;-><init>()V

    .line 25
    return-void
.end method


# virtual methods
.method public at(I)Lorg/cybergarage/http/Parameter;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/ParameterList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/http/Parameter;

    return-object v0
.end method

.method public getParameter(I)Lorg/cybergarage/http/Parameter;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 34
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/ParameterList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/http/Parameter;

    return-object v0
.end method

.method public getParameter(Ljava/lang/String;)Lorg/cybergarage/http/Parameter;
    .locals 5
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 39
    if-nez p1, :cond_1

    move-object v2, v3

    .line 48
    :cond_0
    :goto_0
    return-object v2

    .line 42
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/http/ParameterList;->size()I

    move-result v1

    .line 43
    .local v1, "nLists":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 44
    invoke-virtual {p0, v0}, Lorg/cybergarage/http/ParameterList;->at(I)Lorg/cybergarage/http/Parameter;

    move-result-object v2

    .line 45
    .local v2, "param":Lorg/cybergarage/http/Parameter;
    invoke-virtual {v2}, Lorg/cybergarage/http/Parameter;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p1, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v4

    if-eqz v4, :cond_0

    .line 43
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v2    # "param":Lorg/cybergarage/http/Parameter;
    :cond_2
    move-object v2, v3

    .line 48
    goto :goto_0
.end method

.method public getValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 53
    invoke-virtual {p0, p1}, Lorg/cybergarage/http/ParameterList;->getParameter(Ljava/lang/String;)Lorg/cybergarage/http/Parameter;

    move-result-object v0

    .line 54
    .local v0, "param":Lorg/cybergarage/http/Parameter;
    if-nez v0, :cond_0

    .line 55
    const-string v1, ""

    .line 56
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/http/Parameter;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
