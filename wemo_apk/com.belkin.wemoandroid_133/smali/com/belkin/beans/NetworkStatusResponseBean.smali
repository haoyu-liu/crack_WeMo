.class public Lcom/belkin/beans/NetworkStatusResponseBean;
.super Ljava/lang/Object;
.source "NetworkStatusResponseBean.java"


# instance fields
.field private status:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    const/4 v0, 0x0

    iput v0, p0, Lcom/belkin/beans/NetworkStatusResponseBean;->status:I

    return-void
.end method


# virtual methods
.method public getStatus()I
    .locals 1

    .prologue
    .line 17
    iget v0, p0, Lcom/belkin/beans/NetworkStatusResponseBean;->status:I

    return v0
.end method

.method public setStatus(I)V
    .locals 0
    .param p1, "status"    # I

    .prologue
    .line 10
    iput p1, p0, Lcom/belkin/beans/NetworkStatusResponseBean;->status:I

    .line 11
    return-void
.end method
