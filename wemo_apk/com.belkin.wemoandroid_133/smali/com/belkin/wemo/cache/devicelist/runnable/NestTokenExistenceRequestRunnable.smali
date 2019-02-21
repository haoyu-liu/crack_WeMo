.class public Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "NestTokenExistenceRequestRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V
    .locals 0
    .param p1, "deviceListManager"    # Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 19
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->context:Landroid/content/Context;

    .line 20
    return-void
.end method


# virtual methods
.method protected getLoggerTag()Ljava/lang/String;
    .locals 4

    .prologue
    .line 24
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
    .locals 5

    .prologue
    .line 29
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Checking Nest Token Existence- "

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    :try_start_0
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestCheckForNestTokenExistence;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->deviceListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->context:Landroid/content/Context;

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestCheckForNestTokenExistence;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Landroid/content/Context;)V

    .line 32
    .local v2, "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestCheckForNestTokenExistence;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 33
    .local v0, "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    .end local v0    # "crm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v2    # "nestDevices":Lcom/belkin/wemo/cache/cloud/CloudRequestCheckForNestTokenExistence;
    :goto_0
    return-void

    .line 34
    :catch_0
    move-exception v1

    .line 35
    .local v1, "e":Ljava/lang/Exception;
    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/NestTokenExistenceRequestRunnable;->TAG:Ljava/lang/String;

    const-string v4, "Exception: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method
