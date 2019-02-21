.class public Lcom/belkin/wemo/cache/utils/RMNetworkUtilsImpl;
.super Ljava/lang/Object;
.source "RMNetworkUtilsImpl.java"

# interfaces
.implements Lcom/belkin/wemo/cache/utils/RMINetworkUtils;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public isLocal()Z
    .locals 1

    .prologue
    .line 7
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v0

    return v0
.end method

.method public setLocal(Z)V
    .locals 0
    .param p1, "isLocal"    # Z

    .prologue
    .line 12
    invoke-static {p1}, Lcom/belkin/wemo/cache/utils/NetworkMode;->setLocal(Z)V

    .line 13
    return-void
.end method
