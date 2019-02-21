.class public Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;
.super Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;
.source "FetchRulesSyncLocalRunnable.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "FetchRulesSyncLocalRunnable"


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    .prologue
    .line 73
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalAbstractRunnable;-><init>(Landroid/content/Context;)V

    .line 75
    iput-object p2, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;

    .line 76
    iput-object p3, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    .line 77
    return-void
.end method

.method private syncLowerDevicesDB(ILjava/util/ArrayList;)V
    .locals 4
    .param p1, "latestDBVersion"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 80
    .local p2, "lowerDBVersionDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 81
    .local v0, "size":I
    const-string v1, "FetchRulesSyncLocalRunnable"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Devices with older versions of DB to be synced: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    if-lez v0, :cond_0

    .line 84
    new-instance v1, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;

    iget-object v2, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->context:Landroid/content/Context;

    invoke-direct {v1, v2, p2, p1}, Lcom/belkin/wemo/rules/runnable/SyncRulesLocalRunnable;-><init>(Landroid/content/Context;Ljava/util/ArrayList;I)V

    invoke-static {v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 87
    :cond_0
    return-void
.end method


# virtual methods
.method protected sendError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 92
    const-string v0, "FetchRulesSyncLocalRunnable"

    const-string v1, "Fetch Rules: ERROR: "

    invoke-static {v0, v1, p1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 93
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    if-eqz v0, :cond_0

    .line 94
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->errorCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    invoke-interface {v0}, Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;->onError()V

    .line 96
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
    .line 102
    .local p3, "lowerDBVersionDeviceUDNsList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->successCallback:Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;

    invoke-interface {v0, p1, p2}, Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;->onSuccess(Ljava/lang/String;I)V

    .line 106
    :cond_0
    invoke-direct {p0, p2, p3}, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;->syncLowerDevicesDB(ILjava/util/ArrayList;)V

    .line 107
    return-void
.end method
