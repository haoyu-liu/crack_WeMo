.class public Lcom/belkin/beans/SignalStrengthResponseBean;
.super Ljava/lang/Object;
.source "SignalStrengthResponseBean.java"


# instance fields
.field private signalStrength:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getSignalStrength()Ljava/lang/String;
    .locals 1

    .prologue
    .line 12
    iget-object v0, p0, Lcom/belkin/beans/SignalStrengthResponseBean;->signalStrength:Ljava/lang/String;

    return-object v0
.end method

.method public setSignalStrength(Ljava/lang/String;)V
    .locals 0
    .param p1, "signalStrength"    # Ljava/lang/String;

    .prologue
    .line 8
    iput-object p1, p0, Lcom/belkin/beans/SignalStrengthResponseBean;->signalStrength:Ljava/lang/String;

    .line 9
    return-void
.end method
