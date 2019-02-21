.class public Lorg/cybergarage/upnp/Action;
.super Ljava/lang/Object;
.source "Action.java"


# static fields
.field public static final ELEM_NAME:Ljava/lang/String; = "action"

.field private static final NAME:Ljava/lang/String; = "name"


# instance fields
.field private actionNode:Lorg/cybergarage/xml/Node;

.field private mutex:Lorg/cybergarage/util/Mutex;

.field private serviceNode:Lorg/cybergarage/xml/Node;

.field private upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

.field private userData:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/Action;)V
    .locals 1
    .param p1, "action"    # Lorg/cybergarage/upnp/Action;

    .prologue
    .line 104
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    new-instance v0, Lorg/cybergarage/util/Mutex;

    invoke-direct {v0}, Lorg/cybergarage/util/Mutex;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->mutex:Lorg/cybergarage/util/Mutex;

    .line 443
    new-instance v0, Lorg/cybergarage/upnp/UPnPStatus;

    invoke-direct {v0}, Lorg/cybergarage/upnp/UPnPStatus;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    .line 465
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->userData:Ljava/lang/Object;

    .line 105
    invoke-direct {p1}, Lorg/cybergarage/upnp/Action;->getServiceNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->serviceNode:Lorg/cybergarage/xml/Node;

    .line 106
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->actionNode:Lorg/cybergarage/xml/Node;

    .line 107
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/xml/Node;)V
    .locals 2
    .param p1, "serviceNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    new-instance v0, Lorg/cybergarage/util/Mutex;

    invoke-direct {v0}, Lorg/cybergarage/util/Mutex;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->mutex:Lorg/cybergarage/util/Mutex;

    .line 443
    new-instance v0, Lorg/cybergarage/upnp/UPnPStatus;

    invoke-direct {v0}, Lorg/cybergarage/upnp/UPnPStatus;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    .line 465
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->userData:Ljava/lang/Object;

    .line 93
    iput-object p1, p0, Lorg/cybergarage/upnp/Action;->serviceNode:Lorg/cybergarage/xml/Node;

    .line 94
    new-instance v0, Lorg/cybergarage/xml/Node;

    const-string v1, "action"

    invoke-direct {v0, v1}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->actionNode:Lorg/cybergarage/xml/Node;

    .line 95
    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V
    .locals 1
    .param p1, "serviceNode"    # Lorg/cybergarage/xml/Node;
    .param p2, "actionNode"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    new-instance v0, Lorg/cybergarage/util/Mutex;

    invoke-direct {v0}, Lorg/cybergarage/util/Mutex;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->mutex:Lorg/cybergarage/util/Mutex;

    .line 443
    new-instance v0, Lorg/cybergarage/upnp/UPnPStatus;

    invoke-direct {v0}, Lorg/cybergarage/upnp/UPnPStatus;-><init>()V

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    .line 465
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/cybergarage/upnp/Action;->userData:Ljava/lang/Object;

    .line 99
    iput-object p1, p0, Lorg/cybergarage/upnp/Action;->serviceNode:Lorg/cybergarage/xml/Node;

    .line 100
    iput-object p2, p0, Lorg/cybergarage/upnp/Action;->actionNode:Lorg/cybergarage/xml/Node;

    .line 101
    return-void
.end method

.method private clearOutputAgumentValues()V
    .locals 5

    .prologue
    .line 280
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 281
    .local v1, "allArgList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v0

    .line 282
    .local v0, "allArgCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v0, :cond_1

    .line 283
    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v2

    .line 284
    .local v2, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->isOutDirection()Z

    move-result v4

    if-nez v4, :cond_0

    .line 282
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 286
    :cond_0
    const-string v4, ""

    invoke-virtual {v2, v4}, Lorg/cybergarage/upnp/Argument;->setValue(Ljava/lang/String;)V

    goto :goto_1

    .line 288
    .end local v2    # "arg":Lorg/cybergarage/upnp/Argument;
    :cond_1
    return-void
.end method

.method private getActionData()Lorg/cybergarage/upnp/xml/ActionData;
    .locals 2

    .prologue
    .line 312
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    .line 313
    .local v0, "node":Lorg/cybergarage/xml/Node;
    invoke-virtual {v0}, Lorg/cybergarage/xml/Node;->getUserData()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lorg/cybergarage/upnp/xml/ActionData;

    .line 314
    .local v1, "userData":Lorg/cybergarage/upnp/xml/ActionData;
    if-nez v1, :cond_0

    .line 315
    new-instance v1, Lorg/cybergarage/upnp/xml/ActionData;

    .end local v1    # "userData":Lorg/cybergarage/upnp/xml/ActionData;
    invoke-direct {v1}, Lorg/cybergarage/upnp/xml/ActionData;-><init>()V

    .line 316
    .restart local v1    # "userData":Lorg/cybergarage/upnp/xml/ActionData;
    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->setUserData(Ljava/lang/Object;)V

    .line 317
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/xml/ActionData;->setNode(Lorg/cybergarage/xml/Node;)V

    .line 319
    :cond_0
    return-object v1
.end method

.method private getControlResponse()Lorg/cybergarage/upnp/control/ControlResponse;
    .locals 1

    .prologue
    .line 363
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getActionData()Lorg/cybergarage/upnp/xml/ActionData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/ActionData;->getControlResponse()Lorg/cybergarage/upnp/control/ControlResponse;

    move-result-object v0

    return-object v0
.end method

.method private getServiceNode()Lorg/cybergarage/xml/Node;
    .locals 1

    .prologue
    .line 64
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->serviceNode:Lorg/cybergarage/xml/Node;

    return-object v0
.end method

.method public static isActionNode(Lorg/cybergarage/xml/Node;)Z
    .locals 2
    .param p0, "node"    # Lorg/cybergarage/xml/Node;

    .prologue
    .line 131
    const-string v0, "action"

    invoke-virtual {p0}, Lorg/cybergarage/xml/Node;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method private setControlResponse(Lorg/cybergarage/upnp/control/ControlResponse;)V
    .locals 1
    .param p1, "res"    # Lorg/cybergarage/upnp/control/ControlResponse;

    .prologue
    .line 368
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getActionData()Lorg/cybergarage/upnp/xml/ActionData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/ActionData;->setControlResponse(Lorg/cybergarage/upnp/control/ControlResponse;)V

    .line 369
    return-void
.end method


# virtual methods
.method public getActionListener()Lorg/cybergarage/upnp/control/ActionListener;
    .locals 1

    .prologue
    .line 328
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getActionData()Lorg/cybergarage/upnp/xml/ActionData;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/xml/ActionData;->getActionListener()Lorg/cybergarage/upnp/control/ActionListener;

    move-result-object v0

    return-object v0
.end method

.method public getActionNode()Lorg/cybergarage/xml/Node;
    .locals 1

    .prologue
    .line 85
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->actionNode:Lorg/cybergarage/xml/Node;

    return-object v0
.end method

.method public getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/Argument;
    .locals 7
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 222
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 223
    .local v1, "argList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v4

    .line 224
    .local v4, "nArgs":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_2

    .line 225
    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v0

    .line 226
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getName()Ljava/lang/String;

    move-result-object v2

    .line 227
    .local v2, "argName":Ljava/lang/String;
    if-nez v2, :cond_1

    .line 224
    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 229
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    const/4 v6, 0x1

    if-ne v5, v6, :cond_0

    .line 232
    .end local v0    # "arg":Lorg/cybergarage/upnp/Argument;
    .end local v2    # "argName":Ljava/lang/String;
    :goto_1
    return-object v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public getArgumentIntegerValue(Ljava/lang/String;)I
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 300
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Action;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/Argument;

    move-result-object v0

    .line 301
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    if-nez v0, :cond_0

    .line 302
    const/4 v1, 0x0

    .line 303
    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getIntegerValue()I

    move-result v1

    goto :goto_0
.end method

.method public getArgumentList()Lorg/cybergarage/upnp/ArgumentList;
    .locals 8

    .prologue
    .line 157
    new-instance v1, Lorg/cybergarage/upnp/ArgumentList;

    invoke-direct {v1}, Lorg/cybergarage/upnp/ArgumentList;-><init>()V

    .line 158
    .local v1, "argumentList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v6

    const-string v7, "argumentList"

    invoke-virtual {v6, v7}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v2

    .line 159
    .local v2, "argumentListNode":Lorg/cybergarage/xml/Node;
    if-nez v2, :cond_1

    .line 169
    :cond_0
    return-object v1

    .line 161
    :cond_1
    invoke-virtual {v2}, Lorg/cybergarage/xml/Node;->getNNodes()I

    move-result v5

    .line 162
    .local v5, "nodeCnt":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v5, :cond_0

    .line 163
    invoke-virtual {v2, v3}, Lorg/cybergarage/xml/Node;->getNode(I)Lorg/cybergarage/xml/Node;

    move-result-object v4

    .line 164
    .local v4, "node":Lorg/cybergarage/xml/Node;
    invoke-static {v4}, Lorg/cybergarage/upnp/Argument;->isArgumentNode(Lorg/cybergarage/xml/Node;)Z

    move-result v6

    if-nez v6, :cond_2

    .line 162
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 166
    :cond_2
    new-instance v0, Lorg/cybergarage/upnp/Argument;

    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getServiceNode()Lorg/cybergarage/xml/Node;

    move-result-object v6

    invoke-direct {v0, v6, v4}, Lorg/cybergarage/upnp/Argument;-><init>(Lorg/cybergarage/xml/Node;Lorg/cybergarage/xml/Node;)V

    .line 167
    .local v0, "argument":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v1, v0}, Lorg/cybergarage/upnp/ArgumentList;->add(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public getArgumentValue(Ljava/lang/String;)Ljava/lang/String;
    .locals 2
    .param p1, "name"    # Ljava/lang/String;

    .prologue
    .line 292
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Action;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/Argument;

    move-result-object v0

    .line 293
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    if-nez v0, :cond_0

    .line 294
    const-string v1, ""

    .line 295
    :goto_0
    return-object v1

    :cond_0
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method

.method public getControlStatus()Lorg/cybergarage/upnp/UPnPStatus;
    .locals 1

    .prologue
    .line 373
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getControlResponse()Lorg/cybergarage/upnp/control/ControlResponse;

    move-result-object v0

    invoke-virtual {v0}, Lorg/cybergarage/upnp/control/ControlResponse;->getUPnPError()Lorg/cybergarage/upnp/UPnPStatus;

    move-result-object v0

    return-object v0
.end method

.method public getInputArgumentList()Lorg/cybergarage/upnp/ArgumentList;
    .locals 6

    .prologue
    .line 193
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 194
    .local v1, "allArgList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v0

    .line 195
    .local v0, "allArgCnt":I
    new-instance v3, Lorg/cybergarage/upnp/ArgumentList;

    invoke-direct {v3}, Lorg/cybergarage/upnp/ArgumentList;-><init>()V

    .line 196
    .local v3, "argList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-ge v4, v0, :cond_1

    .line 197
    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v2

    .line 198
    .local v2, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->isInDirection()Z

    move-result v5

    if-nez v5, :cond_0

    .line 196
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 200
    :cond_0
    invoke-virtual {v3, v2}, Lorg/cybergarage/upnp/ArgumentList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 202
    .end local v2    # "arg":Lorg/cybergarage/upnp/Argument;
    :cond_1
    return-object v3
.end method

.method public getName()Ljava/lang/String;
    .locals 2

    .prologue
    .line 147
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1}, Lorg/cybergarage/xml/Node;->getNodeValue(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getOutputArgumentList()Lorg/cybergarage/upnp/ArgumentList;
    .locals 6

    .prologue
    .line 208
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 209
    .local v1, "allArgList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v0

    .line 210
    .local v0, "allArgCnt":I
    new-instance v3, Lorg/cybergarage/upnp/ArgumentList;

    invoke-direct {v3}, Lorg/cybergarage/upnp/ArgumentList;-><init>()V

    .line 211
    .local v3, "argList":Lorg/cybergarage/upnp/ArgumentList;
    const/4 v4, 0x0

    .local v4, "n":I
    :goto_0
    if-ge v4, v0, :cond_1

    .line 212
    invoke-virtual {v1, v4}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v2

    .line 213
    .local v2, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/Argument;->isOutDirection()Z

    move-result v5

    if-nez v5, :cond_0

    .line 211
    :goto_1
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 215
    :cond_0
    invoke-virtual {v3, v2}, Lorg/cybergarage/upnp/ArgumentList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 217
    .end local v2    # "arg":Lorg/cybergarage/upnp/Argument;
    :cond_1
    return-object v3
.end method

.method public getService()Lorg/cybergarage/upnp/Service;
    .locals 2

    .prologue
    .line 69
    new-instance v0, Lorg/cybergarage/upnp/Service;

    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getServiceNode()Lorg/cybergarage/xml/Node;

    move-result-object v1

    invoke-direct {v0, v1}, Lorg/cybergarage/upnp/Service;-><init>(Lorg/cybergarage/xml/Node;)V

    return-object v0
.end method

.method public getStatus()Lorg/cybergarage/upnp/UPnPStatus;
    .locals 1

    .prologue
    .line 458
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    return-object v0
.end method

.method public getUserData()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 474
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->userData:Ljava/lang/Object;

    return-object v0
.end method

.method public lock()V
    .locals 1

    .prologue
    .line 117
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->lock()V

    .line 118
    return-void
.end method

.method public performActionListener(Lorg/cybergarage/upnp/control/ActionRequest;)Z
    .locals 6
    .param p1, "actionReq"    # Lorg/cybergarage/upnp/control/ActionRequest;

    .prologue
    const/4 v3, 0x1

    .line 338
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionListener()Lorg/cybergarage/upnp/control/ActionListener;

    move-result-object v1

    .line 339
    .local v1, "listener":Lorg/cybergarage/upnp/control/ActionListener;
    if-nez v1, :cond_0

    .line 340
    const/4 v3, 0x0

    .line 354
    :goto_0
    return v3

    .line 341
    :cond_0
    new-instance v0, Lorg/cybergarage/upnp/control/ActionResponse;

    invoke-direct {v0}, Lorg/cybergarage/upnp/control/ActionResponse;-><init>()V

    .line 342
    .local v0, "actionRes":Lorg/cybergarage/upnp/control/ActionResponse;
    const/16 v4, 0x191

    invoke-virtual {p0, v4}, Lorg/cybergarage/upnp/Action;->setStatus(I)V

    .line 343
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->clearOutputAgumentValues()V

    .line 344
    invoke-interface {v1, p0}, Lorg/cybergarage/upnp/control/ActionListener;->actionControlReceived(Lorg/cybergarage/upnp/Action;)Z

    move-result v4

    if-ne v4, v3, :cond_2

    .line 345
    invoke-virtual {v0, p0}, Lorg/cybergarage/upnp/control/ActionResponse;->setResponse(Lorg/cybergarage/upnp/Action;)V

    .line 351
    :goto_1
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v4

    if-ne v4, v3, :cond_1

    .line 352
    invoke-virtual {v0}, Lorg/cybergarage/upnp/control/ActionResponse;->print()V

    .line 353
    :cond_1
    invoke-virtual {p1, v0}, Lorg/cybergarage/upnp/control/ActionRequest;->post(Lorg/cybergarage/http/HTTPResponse;)Z

    goto :goto_0

    .line 348
    :cond_2
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getStatus()Lorg/cybergarage/upnp/UPnPStatus;

    move-result-object v2

    .line 349
    .local v2, "upnpStatus":Lorg/cybergarage/upnp/UPnPStatus;
    invoke-virtual {v2}, Lorg/cybergarage/upnp/UPnPStatus;->getCode()I

    move-result v4

    invoke-virtual {v2}, Lorg/cybergarage/upnp/UPnPStatus;->getDescription()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v4, v5}, Lorg/cybergarage/upnp/control/ActionResponse;->setFaultResponse(ILjava/lang/String;)V

    goto :goto_1
.end method

.method public postControlAction()Ljava/lang/String;
    .locals 2

    .prologue
    .line 384
    const v0, 0x2bf20

    const/16 v1, 0x7530

    invoke-virtual {p0, v0, v1}, Lorg/cybergarage/upnp/Action;->postControlAction(II)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public postControlAction(II)Ljava/lang/String;
    .locals 12
    .param p1, "soTimeout"    # I
    .param p2, "connectTimeout"    # I

    .prologue
    const/4 v11, 0x1

    .line 390
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    .line 391
    .local v0, "actionArgList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getInputArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 392
    .local v1, "actionInputArgList":Lorg/cybergarage/upnp/ArgumentList;
    new-instance v2, Lorg/cybergarage/upnp/control/ActionRequest;

    invoke-direct {v2}, Lorg/cybergarage/upnp/control/ActionRequest;-><init>()V

    .line 393
    .local v2, "ctrlReq":Lorg/cybergarage/upnp/control/ActionRequest;
    invoke-virtual {v2, p0, v1}, Lorg/cybergarage/upnp/control/ActionRequest;->setRequest(Lorg/cybergarage/upnp/Action;Lorg/cybergarage/upnp/ArgumentList;)V

    .line 394
    const-string v8, "CybverGarage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Request recieved : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v8

    if-ne v8, v11, :cond_0

    .line 396
    invoke-virtual {v2}, Lorg/cybergarage/upnp/control/ActionRequest;->print()V

    .line 397
    :cond_0
    invoke-virtual {v2, p1, p2}, Lorg/cybergarage/upnp/control/ActionRequest;->post(II)Lorg/cybergarage/upnp/control/ActionResponse;

    move-result-object v3

    .line 398
    .local v3, "ctrlRes":Lorg/cybergarage/upnp/control/ActionResponse;
    invoke-static {}, Lorg/cybergarage/util/Debug;->isOn()Z

    move-result v8

    if-ne v8, v11, :cond_1

    .line 399
    invoke-virtual {v3}, Lorg/cybergarage/upnp/control/ActionResponse;->print()V

    .line 400
    :cond_1
    invoke-direct {p0, v3}, Lorg/cybergarage/upnp/Action;->setControlResponse(Lorg/cybergarage/upnp/control/ControlResponse;)V

    .line 402
    invoke-virtual {v3}, Lorg/cybergarage/upnp/control/ActionResponse;->getStatusCode()I

    move-result v6

    .line 404
    .local v6, "statCode":I
    new-instance v7, Ljava/lang/String;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/control/ActionResponse;->getContent()[B

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/lang/String;-><init>([B)V

    .line 406
    .local v7, "strResp":Ljava/lang/String;
    invoke-virtual {p0, v6}, Lorg/cybergarage/upnp/Action;->setStatus(I)V

    .line 407
    invoke-virtual {v3}, Lorg/cybergarage/upnp/control/ActionResponse;->isSuccessful()Z

    move-result v8

    if-nez v8, :cond_2

    .line 408
    const/4 v7, 0x0

    .line 418
    .end local v7    # "strResp":Ljava/lang/String;
    :goto_0
    return-object v7

    .line 409
    .restart local v7    # "strResp":Ljava/lang/String;
    :cond_2
    invoke-virtual {v3}, Lorg/cybergarage/upnp/control/ActionResponse;->getResponse()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v5

    .line 411
    .local v5, "outArgList":Lorg/cybergarage/upnp/ArgumentList;
    :try_start_0
    invoke-virtual {v0, v5}, Lorg/cybergarage/upnp/ArgumentList;->setResArgs(Lorg/cybergarage/upnp/ArgumentList;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    :goto_1
    const-string v8, "CybverGarage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Response recieved : "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 412
    :catch_0
    move-exception v4

    .line 413
    .local v4, "ex":Ljava/lang/IllegalArgumentException;
    const/16 v8, 0x192

    const-string v9, "Action succesfully delivered but invalid arguments returned."

    invoke-virtual {p0, v8, v9}, Lorg/cybergarage/upnp/Action;->setStatus(ILjava/lang/String;)V

    .line 414
    const-string v8, "CybverGarage"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Action succesfully delivered but invalid arguments returned. "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v4}, Ljava/lang/IllegalArgumentException;->getMessage()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v8, v9}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1
.end method

.method public print()V
    .locals 10

    .prologue
    .line 427
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Action : "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getName()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 428
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v1

    .line 429
    .local v1, "argList":Lorg/cybergarage/upnp/ArgumentList;
    invoke-virtual {v1}, Lorg/cybergarage/upnp/ArgumentList;->size()I

    move-result v4

    .line 430
    .local v4, "nArgs":I
    const/4 v3, 0x0

    .local v3, "n":I
    :goto_0
    if-ge v3, v4, :cond_0

    .line 431
    invoke-virtual {v1, v3}, Lorg/cybergarage/upnp/ArgumentList;->getArgument(I)Lorg/cybergarage/upnp/Argument;

    move-result-object v0

    .line 432
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getName()Ljava/lang/String;

    move-result-object v5

    .line 433
    .local v5, "name":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getValue()Ljava/lang/String;

    move-result-object v6

    .line 434
    .local v6, "value":Ljava/lang/String;
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getDirection()Ljava/lang/String;

    move-result-object v2

    .line 435
    .local v2, "dir":Ljava/lang/String;
    sget-object v7, Ljava/lang/System;->out:Ljava/io/PrintStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " ["

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "] = "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, ", "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 430
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 437
    .end local v0    # "arg":Lorg/cybergarage/upnp/Argument;
    .end local v2    # "dir":Ljava/lang/String;
    .end local v5    # "name":Ljava/lang/String;
    .end local v6    # "value":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method public setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V
    .locals 1
    .param p1, "listener"    # Lorg/cybergarage/upnp/control/ActionListener;

    .prologue
    .line 333
    invoke-direct {p0}, Lorg/cybergarage/upnp/Action;->getActionData()Lorg/cybergarage/upnp/xml/ActionData;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/xml/ActionData;->setActionListener(Lorg/cybergarage/upnp/control/ActionListener;)V

    .line 334
    return-void
.end method

.method public setArgumentList(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 5
    .param p1, "al"    # Lorg/cybergarage/upnp/ArgumentList;

    .prologue
    .line 174
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v3

    const-string v4, "argumentList"

    invoke-virtual {v3, v4}, Lorg/cybergarage/xml/Node;->getNode(Ljava/lang/String;)Lorg/cybergarage/xml/Node;

    move-result-object v1

    .line 175
    .local v1, "argumentListNode":Lorg/cybergarage/xml/Node;
    if-nez v1, :cond_0

    .line 176
    new-instance v1, Lorg/cybergarage/xml/Node;

    .end local v1    # "argumentListNode":Lorg/cybergarage/xml/Node;
    const-string v3, "argumentList"

    invoke-direct {v1, v3}, Lorg/cybergarage/xml/Node;-><init>(Ljava/lang/String;)V

    .line 177
    .restart local v1    # "argumentListNode":Lorg/cybergarage/xml/Node;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v3

    invoke-virtual {v3, v1}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    .line 181
    :goto_0
    invoke-virtual {p1}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .line 182
    .local v2, "i":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 183
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Argument;

    .line 184
    .local v0, "a":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getService()Lorg/cybergarage/upnp/Service;

    move-result-object v3

    invoke-virtual {v0, v3}, Lorg/cybergarage/upnp/Argument;->setService(Lorg/cybergarage/upnp/Service;)V

    .line 185
    invoke-virtual {v0}, Lorg/cybergarage/upnp/Argument;->getArgumentNode()Lorg/cybergarage/xml/Node;

    move-result-object v3

    invoke-virtual {v1, v3}, Lorg/cybergarage/xml/Node;->addNode(Lorg/cybergarage/xml/Node;)V

    goto :goto_1

    .line 179
    .end local v0    # "a":Lorg/cybergarage/upnp/Argument;
    .end local v2    # "i":Ljava/util/Iterator;
    :cond_0
    invoke-virtual {v1}, Lorg/cybergarage/xml/Node;->removeAllNodes()V

    goto :goto_0

    .line 188
    .restart local v2    # "i":Ljava/util/Iterator;
    :cond_1
    return-void
.end method

.method public setArgumentValue(Ljava/lang/String;I)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # I

    .prologue
    .line 275
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/cybergarage/upnp/Action;->setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V

    .line 276
    return-void
.end method

.method public setArgumentValue(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "name"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 267
    invoke-virtual {p0, p1}, Lorg/cybergarage/upnp/Action;->getArgument(Ljava/lang/String;)Lorg/cybergarage/upnp/Argument;

    move-result-object v0

    .line 268
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    if-nez v0, :cond_0

    .line 271
    :goto_0
    return-void

    .line 270
    :cond_0
    invoke-virtual {v0, p2}, Lorg/cybergarage/upnp/Argument;->setValue(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public setArgumentValues(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 1
    .param p1, "argList"    # Lorg/cybergarage/upnp/ArgumentList;

    .prologue
    .line 242
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/ArgumentList;->set(Lorg/cybergarage/upnp/ArgumentList;)V

    .line 243
    return-void
.end method

.method public setInArgumentValues(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 1
    .param p1, "argList"    # Lorg/cybergarage/upnp/ArgumentList;

    .prologue
    .line 252
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/ArgumentList;->setReqArgs(Lorg/cybergarage/upnp/ArgumentList;)V

    .line 253
    return-void
.end method

.method public setName(Ljava/lang/String;)V
    .locals 2
    .param p1, "value"    # Ljava/lang/String;

    .prologue
    .line 142
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getActionNode()Lorg/cybergarage/xml/Node;

    move-result-object v0

    const-string v1, "name"

    invoke-virtual {v0, v1, p1}, Lorg/cybergarage/xml/Node;->setNode(Ljava/lang/String;Ljava/lang/String;)V

    .line 143
    return-void
.end method

.method public setOutArgumentValues(Lorg/cybergarage/upnp/ArgumentList;)V
    .locals 1
    .param p1, "argList"    # Lorg/cybergarage/upnp/ArgumentList;

    .prologue
    .line 262
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/ArgumentList;->setResArgs(Lorg/cybergarage/upnp/ArgumentList;)V

    .line 263
    return-void
.end method

.method setService(Lorg/cybergarage/upnp/Service;)V
    .locals 3
    .param p1, "s"    # Lorg/cybergarage/upnp/Service;

    .prologue
    .line 74
    invoke-virtual {p1}, Lorg/cybergarage/upnp/Service;->getServiceNode()Lorg/cybergarage/xml/Node;

    move-result-object v2

    iput-object v2, p0, Lorg/cybergarage/upnp/Action;->serviceNode:Lorg/cybergarage/xml/Node;

    .line 76
    invoke-virtual {p0}, Lorg/cybergarage/upnp/Action;->getArgumentList()Lorg/cybergarage/upnp/ArgumentList;

    move-result-object v2

    invoke-virtual {v2}, Lorg/cybergarage/upnp/ArgumentList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 77
    .local v1, "i":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/cybergarage/upnp/Argument;

    .line 79
    .local v0, "arg":Lorg/cybergarage/upnp/Argument;
    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/Argument;->setService(Lorg/cybergarage/upnp/Service;)V

    goto :goto_0

    .line 81
    .end local v0    # "arg":Lorg/cybergarage/upnp/Argument;
    :cond_0
    return-void
.end method

.method public setStatus(I)V
    .locals 1
    .param p1, "code"    # I

    .prologue
    .line 453
    invoke-static {p1}, Lorg/cybergarage/upnp/UPnPStatus;->code2String(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lorg/cybergarage/upnp/Action;->setStatus(ILjava/lang/String;)V

    .line 454
    return-void
.end method

.method public setStatus(ILjava/lang/String;)V
    .locals 1
    .param p1, "code"    # I
    .param p2, "descr"    # Ljava/lang/String;

    .prologue
    .line 447
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    invoke-virtual {v0, p1}, Lorg/cybergarage/upnp/UPnPStatus;->setCode(I)V

    .line 448
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->upnpStatus:Lorg/cybergarage/upnp/UPnPStatus;

    invoke-virtual {v0, p2}, Lorg/cybergarage/upnp/UPnPStatus;->setDescription(Ljava/lang/String;)V

    .line 449
    return-void
.end method

.method public setUserData(Ljava/lang/Object;)V
    .locals 0
    .param p1, "data"    # Ljava/lang/Object;

    .prologue
    .line 469
    iput-object p1, p0, Lorg/cybergarage/upnp/Action;->userData:Ljava/lang/Object;

    .line 470
    return-void
.end method

.method public unlock()V
    .locals 1

    .prologue
    .line 122
    iget-object v0, p0, Lorg/cybergarage/upnp/Action;->mutex:Lorg/cybergarage/util/Mutex;

    invoke-virtual {v0}, Lorg/cybergarage/util/Mutex;->unlock()V

    .line 123
    return-void
.end method
