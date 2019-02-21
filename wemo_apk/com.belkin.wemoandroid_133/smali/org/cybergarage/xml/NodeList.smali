.class public Lorg/cybergarage/xml/NodeList;
.super Ljava/util/Vector;
.source "NodeList.java"


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
.method public getEndsWith(Ljava/lang/String;)Lorg/cybergarage/xml/Node;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 49
    if-nez p1, :cond_0

    move-object v2, v4

    .line 61
    :goto_0
    return-object v2

    .line 52
    :cond_0
    invoke-virtual {p0}, Lorg/cybergarage/xml/NodeList;->size()I

    move-result v1

    .line 53
    .local v1, "nLists":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    if-ge v0, v1, :cond_3

    .line 54
    invoke-virtual {p0, v0}, Lorg/cybergarage/xml/NodeList;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 55
    .local v2, "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "nodeName":Ljava/lang/String;
    if-nez v3, :cond_2

    .line 53
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 58
    :cond_2
    invoke-virtual {v3, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_1

    goto :goto_0

    .end local v2    # "node":Lorg/cybergarage/xml/Node;
    .end local v3    # "nodeName":Ljava/lang/String;
    :cond_3
    move-object v2, v4

    .line 61
    goto :goto_0
.end method

.method public getNode(I)Lorg/cybergarage/xml/Node;
    .locals 1
    .param p1, "n"    # I

    .prologue
    .line 29
    invoke-virtual {p0, p1}, Lorg/cybergarage/xml/NodeList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/xml/Node;

    return-object v0
.end method

.method public getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;
    .locals 6
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    const/4 v4, 0x0

    .line 34
    if-nez p1, :cond_1

    move-object v2, v4

    .line 44
    :cond_0
    :goto_0
    return-object v2

    .line 37
    :cond_1
    invoke-virtual {p0}, Lorg/cybergarage/xml/NodeList;->size()I

    move-result v1

    .line 38
    .local v1, "nLists":I
    const/4 v0, 0x0

    .local v0, "n":I
    :goto_1
    if-ge v0, v1, :cond_2

    .line 39
    invoke-virtual {p0, v0}, Lorg/cybergarage/xml/NodeList;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 40
    .local v2, "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v3

    .line 41
    .local v3, "nodeName":Ljava/lang/String;
    invoke-virtual {p1, v3}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    move-result v5

    if-eqz v5, :cond_0

    .line 38
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .end local v2    # "node":Lorg/cybergarage/xml/Node;
    .end local v3    # "nodeName":Ljava/lang/String;
    :cond_2
    move-object v2, v4

    .line 44
    goto :goto_0
.end method
