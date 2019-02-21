.class public Lcom/belkin/beans/APBean;
.super Ljava/lang/Object;
.source "APBean.java"


# instance fields
.field private channel:Ljava/lang/Integer;

.field private securityStrength:Ljava/lang/String;

.field private signalStrength:Ljava/lang/Integer;

.field private strSSID:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getChannel()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 74
    iget-object v0, p0, Lcom/belkin/beans/APBean;->channel:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSecurityStrength()Ljava/lang/String;
    .locals 1

    .prologue
    .line 98
    iget-object v0, p0, Lcom/belkin/beans/APBean;->securityStrength:Ljava/lang/String;

    return-object v0
.end method

.method public getSignalStrength()Ljava/lang/Integer;
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/belkin/beans/APBean;->signalStrength:Ljava/lang/Integer;

    return-object v0
.end method

.method public getStrSSID()Ljava/lang/String;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/belkin/beans/APBean;->strSSID:Ljava/lang/String;

    return-object v0
.end method

.method public setChannel(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "channel"    # Ljava/lang/Integer;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/belkin/beans/APBean;->channel:Ljava/lang/Integer;

    .line 69
    return-void
.end method

.method public setSecurityStrength(Ljava/lang/String;)V
    .locals 0
    .param p1, "securityStrength"    # Ljava/lang/String;

    .prologue
    .line 92
    iput-object p1, p0, Lcom/belkin/beans/APBean;->securityStrength:Ljava/lang/String;

    .line 93
    return-void
.end method

.method public setSignalStrength(Ljava/lang/Integer;)V
    .locals 0
    .param p1, "signalStrength"    # Ljava/lang/Integer;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/belkin/beans/APBean;->signalStrength:Ljava/lang/Integer;

    .line 81
    return-void
.end method

.method public setStrSSID(Ljava/lang/String;)V
    .locals 0
    .param p1, "strSSID"    # Ljava/lang/String;

    .prologue
    .line 56
    iput-object p1, p0, Lcom/belkin/beans/APBean;->strSSID:Ljava/lang/String;

    .line 57
    return-void
.end method
