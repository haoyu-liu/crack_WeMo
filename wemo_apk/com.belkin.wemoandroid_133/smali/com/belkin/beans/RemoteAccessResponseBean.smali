.class public Lcom/belkin/beans/RemoteAccessResponseBean;
.super Ljava/lang/Object;
.source "RemoteAccessResponseBean.java"


# instance fields
.field private homeId:Ljava/lang/String;

.field private privateKeyphone:Ljava/lang/String;

.field private privateKeyplugin:Ljava/lang/String;

.field private statusCode:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyplugin:Ljava/lang/String;

    .line 6
    iput-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyphone:Ljava/lang/String;

    .line 7
    iput-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->homeId:Ljava/lang/String;

    .line 8
    iput-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->statusCode:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public getHomeId()Ljava/lang/String;
    .locals 1

    .prologue
    .line 53
    iget-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->homeId:Ljava/lang/String;

    return-object v0
.end method

.method public getPrivateKeyphone()Ljava/lang/String;
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyphone:Ljava/lang/String;

    return-object v0
.end method

.method public getPrivateKeyplugin()Ljava/lang/String;
    .locals 1

    .prologue
    .line 25
    iget-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyplugin:Ljava/lang/String;

    return-object v0
.end method

.method public getStatusCode()Ljava/lang/String;
    .locals 1

    .prologue
    .line 67
    iget-object v0, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->statusCode:Ljava/lang/String;

    return-object v0
.end method

.method public setHomeId(Ljava/lang/String;)V
    .locals 0
    .param p1, "homeId"    # Ljava/lang/String;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->homeId:Ljava/lang/String;

    .line 47
    return-void
.end method

.method public setPrivateKeyphone(Ljava/lang/String;)V
    .locals 0
    .param p1, "privateKeyphone"    # Ljava/lang/String;

    .prologue
    .line 32
    iput-object p1, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyphone:Ljava/lang/String;

    .line 33
    return-void
.end method

.method public setPrivateKeyplugin(Ljava/lang/String;)V
    .locals 0
    .param p1, "privateKeyplugin"    # Ljava/lang/String;

    .prologue
    .line 18
    iput-object p1, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->privateKeyplugin:Ljava/lang/String;

    .line 19
    return-void
.end method

.method public setStatusCode(Ljava/lang/String;)V
    .locals 0
    .param p1, "statusCode"    # Ljava/lang/String;

    .prologue
    .line 60
    iput-object p1, p0, Lcom/belkin/beans/RemoteAccessResponseBean;->statusCode:Ljava/lang/String;

    .line 61
    return-void
.end method
