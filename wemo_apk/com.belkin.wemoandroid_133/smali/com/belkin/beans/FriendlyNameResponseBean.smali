.class public Lcom/belkin/beans/FriendlyNameResponseBean;
.super Ljava/lang/Object;
.source "FriendlyNameResponseBean.java"


# instance fields
.field private strFriendlyName:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public getStrFriendlyName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 8
    iget-object v0, p0, Lcom/belkin/beans/FriendlyNameResponseBean;->strFriendlyName:Ljava/lang/String;

    return-object v0
.end method

.method public setStrFriendlyName(Ljava/lang/String;)V
    .locals 0
    .param p1, "strFriendlyName"    # Ljava/lang/String;

    .prologue
    .line 12
    iput-object p1, p0, Lcom/belkin/beans/FriendlyNameResponseBean;->strFriendlyName:Ljava/lang/String;

    .line 13
    return-void
.end method
