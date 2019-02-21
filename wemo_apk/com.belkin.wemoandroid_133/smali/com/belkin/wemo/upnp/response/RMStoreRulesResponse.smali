.class public Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;
.super Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
.source "RMStoreRulesResponse.java"


# instance fields
.field private errorInfo:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 5
    invoke-direct {p0}, Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public getErrorInfo()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;->errorInfo:Ljava/lang/String;

    return-object v0
.end method

.method public setErrorInfo(Ljava/lang/String;)V
    .locals 0
    .param p1, "errorInfo"    # Ljava/lang/String;

    .prologue
    .line 21
    if-nez p1, :cond_0

    .line 22
    const-string p1, ""

    .line 26
    :goto_0
    return-void

    .line 24
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;->errorInfo:Ljava/lang/String;

    goto :goto_0
.end method
