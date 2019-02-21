.class public Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "CollectEmailIDToWemoCloudRequestRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private deviceType:Ljava/lang/String;

.field private emailAddress:Ljava/lang/String;

.field private mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "emailAddress"    # Ljava/lang/String;
    .param p3, "deviceType"    # Ljava/lang/String;
    .param p4, "mSharePreference"    # Lcom/belkin/wemo/cache/utils/SharePreferences;

    .prologue
    .line 18
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 20
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->emailAddress:Ljava/lang/String;

    .line 21
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->context:Landroid/content/Context;

    .line 22
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->deviceType:Ljava/lang/String;

    .line 23
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    .line 24
    return-void
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 28
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ":"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public run()V
    .locals 7

    .prologue
    .line 33
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Starting Collection of Email Id to Wemo Cloud-- "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    :try_start_0
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDsOnWemoCloud;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->context:Landroid/content/Context;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->emailAddress:Ljava/lang/String;

    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->deviceType:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->mSharePreference:Lcom/belkin/wemo/cache/utils/SharePreferences;

    invoke-direct {v0, v3, v4, v5, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDsOnWemoCloud;-><init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/utils/SharePreferences;)V

    .line 36
    .local v0, "collectEmailIDToWemoCloud":Lcom/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDsOnWemoCloud;
    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->context:Landroid/content/Context;

    invoke-direct {v1, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 37
    .local v1, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .end local v0    # "collectEmailIDToWemoCloud":Lcom/belkin/wemo/cache/cloud/CloudRequestToCollectEmailIDsOnWemoCloud;
    .end local v1    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    :goto_0
    return-void

    .line 38
    :catch_0
    move-exception v2

    .line 39
    .local v2, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/CollectEmailIDToWemoCloudRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Exception: "

    invoke-static {v3, v4, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
