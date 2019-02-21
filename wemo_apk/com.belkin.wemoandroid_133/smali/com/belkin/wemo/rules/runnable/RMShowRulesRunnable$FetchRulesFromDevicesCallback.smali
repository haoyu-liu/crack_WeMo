.class public Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;
.super Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;
.source "RMShowRulesRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesErrorCallback;
.implements Lcom/belkin/wemo/rules/fetch/callback/RMFetchRulesSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4
    name = "FetchRulesFromDevicesCallback"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V
    .locals 0
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    .prologue
    .line 65
    iput-object p1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    .line 66
    invoke-direct {p0, p1, p2, p3}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 67
    return-void
.end method


# virtual methods
.method public onRulesFetchFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesError;

    .prologue
    .line 87
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorCode()I

    move-result v0

    .line 88
    .local v0, "errorCode":I
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesError;->getErrorMessage()Ljava/lang/String;

    move-result-object v1

    .line 90
    .local v1, "message":Ljava/lang/String;
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Rules fetching ERROR. errorCode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "; errorMesssage: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    if-eqz v2, :cond_0

    .line 92
    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    new-instance v3, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-direct {v3, v0, v1}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 94
    :cond_0
    return-void
.end method

.method public onRulesFetched()V
    .locals 4

    .prologue
    .line 71
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Fetch Rules: Rules FETCHED successfully. Parsing rules."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    new-instance v0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->this$0:Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->successCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$FetchRulesFromDevicesCallback;->errorCallback:Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;

    invoke-direct {v0, v1, v2, v3}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;-><init>(Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;Lcom/belkin/wemo/rules/callback/RMShowRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/RMShowRulesErrorCallback;)V

    .line 75
    .local v0, "parseCallback":Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable$ParseRulesCallback;
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Fetch Rules: Parsing Location Info."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    sget-object v1, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->INSTANCE:Lcom/belkin/wemo/rules/location/RMLocationInfoManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/location/RMLocationInfoManager;->read(Lcom/belkin/wemo/rules/location/callback/RMReadLocationSuccessCallback;Lcom/belkin/wemo/rules/location/callback/RMReadLocationErrorCallback;)V

    .line 79
    invoke-static {}, Lcom/belkin/wemo/rules/runnable/RMShowRulesRunnable;->access$000()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Fetch Rules: Parsing Rules."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    sget-object v1, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->INSTANCE:Lcom/belkin/wemo/rules/read/RMParseRulesManager;

    invoke-virtual {v1, v0, v0}, Lcom/belkin/wemo/rules/read/RMParseRulesManager;->parseRules(Lcom/belkin/wemo/rules/read/callback/RMParseRulesSuccessCallback;Lcom/belkin/wemo/rules/read/callback/RMParseRulesErrorCallback;)V

    .line 83
    return-void
.end method
