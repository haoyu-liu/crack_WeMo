.class public Lcom/belkin/wemo/upnp/response/ExtMetaInfo;
.super Ljava/lang/Object;
.source "ExtMetaInfo.java"


# instance fields
.field private fwStatus:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0
    .param p1, "fwStatus"    # Ljava/lang/String;

    .prologue
    .line 8
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;->fwStatus:Ljava/lang/String;

    .line 10
    return-void
.end method


# virtual methods
.method public getFwStatus()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;->fwStatus:Ljava/lang/String;

    return-object v0
.end method

.method public setFwStatus(Ljava/lang/String;)V
    .locals 0
    .param p1, "fwStatus"    # Ljava/lang/String;

    .prologue
    .line 21
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/ExtMetaInfo;->fwStatus:Ljava/lang/String;

    .line 22
    return-void
.end method
