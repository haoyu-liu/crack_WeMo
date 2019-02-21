.class public Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "HideGroupRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

.field private groupId:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;Landroid/content/Context;Ljava/lang/String;)V
    .locals 0
    .param p1, "successCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;
    .param p3, "context"    # Landroid/content/Context;
    .param p4, "groupId"    # Ljava/lang/String;

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    .line 29
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    .line 30
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->groupId:Ljava/lang/String;

    .line 31
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/16 v9, -0x384

    .line 35
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    if-eqz v6, :cond_4

    .line 36
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->groupId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/CacheManager;->deleteDevicesInGroup(Ljava/lang/String;)I

    move-result v1

    .line 37
    .local v1, "dbDeleteCount":I
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    invoke-static {v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->groupId:Ljava/lang/String;

    invoke-virtual {v6, v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->deleteDevicesInGroup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v5

    .line 39
    .local v5, "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v6

    if-ne v1, v6, :cond_3

    .line 40
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    .local v2, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 41
    .local v4, "mac":Ljava/lang/String;
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    invoke-direct {v0, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 42
    .local v0, "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudRequestHideDevice;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    invoke-direct {v6, v7, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestHideDevice;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v0, v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0

    .line 44
    .end local v0    # "cRM":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v4    # "mac":Ljava/lang/String;
    :cond_0
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;

    if-eqz v6, :cond_1

    .line 45
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->successCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->groupId:Ljava/lang/String;

    invoke-interface {v6, v7}, Lcom/belkin/wemo/cache/devicelist/callback/HideGroupSuccessCallback;->onGroupHidden(Ljava/lang/String;)V

    .line 55
    .end local v2    # "i$":Ljava/util/Iterator;
    :cond_1
    :goto_1
    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v6

    if-eqz v6, :cond_2

    .line 56
    new-instance v3, Lcom/belkin/wemo/cache/utils/MoreUtil;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/utils/MoreUtil;-><init>()V

    .line 57
    .local v3, "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    const-string v6, "cache.db"

    iget-object v7, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->context:Landroid/content/Context;

    invoke-virtual {v3, v6, v7}, Lcom/belkin/wemo/cache/utils/MoreUtil;->copyDbToDownloadDirectory(Ljava/lang/String;Landroid/content/Context;)V

    .line 65
    .end local v1    # "dbDeleteCount":I
    .end local v3    # "mU":Lcom/belkin/wemo/cache/utils/MoreUtil;
    .end local v5    # "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_2
    :goto_2
    return-void

    .line 48
    .restart local v1    # "dbDeleteCount":I
    .restart local v5    # "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_3
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->TAG:Ljava/lang/String;

    const-string v7, "DB Delete Count != Devices Array Delete Count"

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    if-eqz v6, :cond_1

    .line 50
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    new-instance v7, Lcom/belkin/wemo/error/WeMoError;

    const-string v8, "Group could not be deleted."

    invoke-direct {v7, v9, v8}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v6, v7}, Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;->onHideGroupError(Lcom/belkin/wemo/error/WeMoError;)V

    goto :goto_1

    .line 60
    .end local v1    # "dbDeleteCount":I
    .end local v5    # "macList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_4
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->TAG:Ljava/lang/String;

    const-string v7, "Context is NULL"

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    if-eqz v6, :cond_2

    .line 62
    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/HideGroupRunnable;->errorCallback:Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;

    new-instance v7, Lcom/belkin/wemo/error/WeMoError;

    const-string v8, "Group could not be deleted."

    invoke-direct {v7, v9, v8}, Lcom/belkin/wemo/error/WeMoError;-><init>(ILjava/lang/String;)V

    invoke-interface {v6, v7}, Lcom/belkin/wemo/cache/devicelist/callback/HideGroupErrorCallback;->onHideGroupError(Lcom/belkin/wemo/error/WeMoError;)V

    goto :goto_2
.end method
