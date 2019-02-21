.class public Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;
.super Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
.source "RMFetchRulesResponse.java"


# instance fields
.field private errorCode:I

.field private ruleDBPath:Ljava/lang/String;

.field private ruleDBVersion:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;-><init>()V

    return-void
.end method


# virtual methods
.method public getErrorCode()I
    .locals 1

    .prologue
    .line 44
    iget v0, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->errorCode:I

    return v0
.end method

.method public getRuleDBPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 16
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->ruleDBPath:Ljava/lang/String;

    return-object v0
.end method

.method public getRuleDBVersion()I
    .locals 1

    .prologue
    .line 32
    iget v0, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->ruleDBVersion:I

    return v0
.end method

.method public setErrorCode(I)V
    .locals 0
    .param p1, "errorCode"    # I

    .prologue
    .line 50
    iput p1, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->errorCode:I

    .line 51
    return-void
.end method

.method public setRuleDBPath(Ljava/lang/String;)V
    .locals 1
    .param p1, "ruleDBPath"    # Ljava/lang/String;

    .prologue
    .line 22
    if-nez p1, :cond_0

    .line 23
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->ruleDBPath:Ljava/lang/String;

    .line 27
    :goto_0
    return-void

    .line 25
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->ruleDBPath:Ljava/lang/String;

    goto :goto_0
.end method

.method public setRuleDBVersion(I)V
    .locals 0
    .param p1, "ruleDBVersion"    # I

    .prologue
    .line 38
    iput p1, p0, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->ruleDBVersion:I

    .line 39
    return-void
.end method
