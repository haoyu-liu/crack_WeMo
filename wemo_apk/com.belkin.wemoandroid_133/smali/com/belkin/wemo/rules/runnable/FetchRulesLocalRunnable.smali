.class public Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;
.super Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;
.source "FetchRulesLocalRunnable.java"


# static fields
.field public static final FETCH_RULES_RUNNABLE_TAG:Ljava/lang/String; = "FetchRulesLocalRunnable"


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    .prologue
    .line 72
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;-><init>(Landroid/content/Context;)V

    .line 73
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    .line 74
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    .line 76
    return-void
.end method


# virtual methods
.method protected sendError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 80
    const-string v0, "FetchRulesLocalRunnable"

    const-string v1, "Fetch Rules: ERROR: "

    invoke-static {v0, v1, p1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 81
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 82
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;->onError()V

    .line 84
    :cond_0
    return-void
.end method

.method protected sendSuccessResponse(Ljava/lang/String;ILjava/util/ArrayList;)V
    .locals 1
    .param p1, "pragmaUserVersion"    # Ljava/lang/String;
    .param p2, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 89
    .local p3, "lowerDBVersionDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    if-eqz v0, :cond_0

    .line 90
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;

    invoke-interface {v0, p1, p2, p3}, Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;->onSuccess(Ljava/lang/String;ILjava/util/ArrayList;)V

    .line 93
    :cond_0
    return-void
.end method
