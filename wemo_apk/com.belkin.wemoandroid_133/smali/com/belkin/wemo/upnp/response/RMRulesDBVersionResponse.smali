.class public Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;
.super Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
.source "RMRulesDBVersionResponse.java"


# instance fields
.field private rulesDBVersion:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 9
    invoke-direct {p0}, Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;-><init>()V

    .line 10
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->rulesDBVersion:Ljava/lang/String;

    .line 11
    return-void
.end method


# virtual methods
.method public getRulesDBVersion()Ljava/lang/String;
    .locals 1

    .prologue
    .line 17
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->rulesDBVersion:Ljava/lang/String;

    return-object v0
.end method

.method public setRulesDBVersion(Ljava/lang/String;)V
    .locals 1
    .param p1, "rulesDBVersion"    # Ljava/lang/String;

    .prologue
    .line 24
    if-eqz p1, :cond_0

    .line 25
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->rulesDBVersion:Ljava/lang/String;

    .line 30
    :goto_0
    return-void

    .line 27
    :cond_0
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBVersionResponse;->rulesDBVersion:Ljava/lang/String;

    goto :goto_0
.end method
