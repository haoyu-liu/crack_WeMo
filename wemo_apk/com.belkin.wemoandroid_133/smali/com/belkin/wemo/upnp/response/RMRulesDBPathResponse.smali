.class public Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;
.super Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;
.source "RMRulesDBPathResponse.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private rulesDBPath:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 9
    const-class v0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 11
    invoke-direct {p0}, Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;-><init>()V

    .line 12
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->rulesDBPath:Ljava/lang/String;

    .line 13
    return-void
.end method


# virtual methods
.method public getRulesDBPath()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    iget-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->rulesDBPath:Ljava/lang/String;

    return-object v0
.end method

.method public setRulesDBPath(Ljava/lang/String;)V
    .locals 3
    .param p1, "rulesDBPath"    # Ljava/lang/String;

    .prologue
    .line 26
    if-eqz p1, :cond_0

    .line 27
    sget-object v0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Setting rules db path to: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    iput-object p1, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->rulesDBPath:Ljava/lang/String;

    .line 33
    :goto_0
    return-void

    .line 30
    :cond_0
    sget-object v0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->TAG:Ljava/lang/String;

    const-string v1, "rules db path received is NULL. Setting empty string"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lcom/belkin/wemo/upnp/response/RMRulesDBPathResponse;->rulesDBPath:Ljava/lang/String;

    goto :goto_0
.end method
