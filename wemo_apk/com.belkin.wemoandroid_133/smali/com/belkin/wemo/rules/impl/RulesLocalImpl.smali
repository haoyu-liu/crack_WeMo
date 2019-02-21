.class Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
.super Ljava/lang/Object;
.source "RulesLocalImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/IWeMoRules;


# static fields
.field public static final RULES_LOCAL_IMPL_TAG:Ljava/lang/String; = "RulesLocalImpl"

.field private static instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 77
    return-void
.end method

.method public static declared-synchronized destroyInstance()V
    .locals 2

    .prologue
    .line 95
    const-class v1, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    if-eqz v0, :cond_0

    .line 96
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 98
    :cond_0
    monitor-exit v1

    return-void

    .line 95
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
    .locals 2

    .prologue
    .line 85
    const-class v1, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    if-nez v0, :cond_0

    .line 86
    new-instance v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;-><init>()V

    sput-object v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;

    .line 88
    :cond_0
    sget-object v0, Lcom/belkin/wemo/rules/impl/RulesLocalImpl;->instance:Lcom/belkin/wemo/rules/impl/RulesLocalImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 85
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public fetchRules(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;

    .prologue
    .line 140
    const-string v0, "RulesLocalImpl"

    const-string v1, "Fetching Rules only and no device DB sync..."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    new-instance v0, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;

    invoke-direct {v0, p1, p2, p3}, Lcom/belkin/wemo/rules/runnable/FetchRulesLocalRunnable;-><init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesErrorCallback;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 142
    return-void
.end method

.method public fetchRulesAndSyncDevices(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;

    .prologue
    .line 128
    const-string v0, "RulesLocalImpl"

    const-string v1, "Fetching Rules and sync devices with out dates DBs..."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    new-instance v0, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;

    invoke-direct {v0, p1, p2, p3}, Lcom/belkin/wemo/rules/runnable/FetchRulesSyncLocalRunnable;-><init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncSuccessCallback;Lcom/belkin/wemo/rules/callback/FetchRulesAndSyncErrorCallback;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 131
    return-void
.end method

.method public storeRules(Landroid/content/Context;Ljava/util/HashMap;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;",
            "Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 109
    .local p2, "weeklyRecordsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;[Ljava/lang/String;>;"
    const-string v0, "RulesLocalImpl"

    const-string v1, "Storing Rules..."

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    if-eqz p2, :cond_1

    .line 114
    new-instance v0, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;

    invoke-direct {v0, p1, p3, p4, p2}, Lcom/belkin/wemo/rules/runnable/StoreRulesLocalRunnable;-><init>(Landroid/content/Context;Lcom/belkin/wemo/rules/callback/StoreRulesSuccessCallback;Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;Ljava/util/HashMap;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 119
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    if-eqz p4, :cond_0

    .line 116
    new-instance v0, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/4 v1, -0x1

    const-string v2, "Error while processing Rules!"

    invoke-direct {v0, v1, v2}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/callback/StoreRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    goto :goto_0
.end method
