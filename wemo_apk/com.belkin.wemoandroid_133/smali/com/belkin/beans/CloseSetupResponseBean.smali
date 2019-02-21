.class public Lcom/belkin/beans/CloseSetupResponseBean;
.super Ljava/lang/Object;
.source "CloseSetupResponseBean.java"


# instance fields
.field private closeSetupStatus:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getCloseSetupStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/beans/CloseSetupResponseBean;->closeSetupStatus:Ljava/lang/String;

    return-object v0
.end method

.method public setCloseSetupStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "closeSetupStatus"    # Ljava/lang/String;

    .prologue
    .line 10
    iput-object p1, p0, Lcom/belkin/beans/CloseSetupResponseBean;->closeSetupStatus:Ljava/lang/String;

    .line 11
    return-void
.end method
