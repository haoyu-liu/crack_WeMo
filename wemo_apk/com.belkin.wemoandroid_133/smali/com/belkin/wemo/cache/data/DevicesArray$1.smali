.class Lcom/belkin/wemo/cache/data/DevicesArray$1;
.super Ljava/lang/Object;
.source "DevicesArray.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/data/DevicesArray;->updateIcon(Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

.field final synthetic val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/data/DevicesArray;Lcom/belkin/wemo/cache/devicelist/WeMoDevice;)V
    .locals 0

    .prologue
    .line 245
    iput-object p1, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    iput-object p2, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    const/4 v6, 0x3

    const/4 v10, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 248
    invoke-static {}, Lcom/belkin/wemo/cache/utils/NetworkMode;->isLocal()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 249
    sget v4, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0xb

    if-lt v4, v5, :cond_1

    .line 250
    new-instance v4, Lcom/belkin/wemo/cache/devicelist/IconDownloader;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/devicelist/IconDownloader;-><init>()V

    sget-object v5, Landroid/os/AsyncTask;->THREAD_POOL_EXECUTOR:Ljava/util/concurrent/Executor;

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v8

    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-virtual {v7}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v9

    iget-object v7, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-static {v7}, Lcom/belkin/wemo/cache/data/DevicesArray;->access$000(Lcom/belkin/wemo/cache/data/DevicesArray;)Landroid/content/Context;

    move-result-object v7

    aput-object v7, v6, v10

    invoke-virtual {v4, v5, v6}, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->executeOnExecutor(Ljava/util/concurrent/Executor;[Ljava/lang/Object;)Landroid/os/AsyncTask;

    .line 269
    :cond_0
    :goto_0
    return-void

    .line 253
    :cond_1
    new-instance v4, Lcom/belkin/wemo/cache/devicelist/IconDownloader;

    invoke-direct {v4}, Lcom/belkin/wemo/cache/devicelist/IconDownloader;-><init>()V

    new-array v5, v6, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getLogoURL()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v8

    iget-object v6, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v9

    iget-object v6, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-static {v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->access$000(Lcom/belkin/wemo/cache/data/DevicesArray;)Landroid/content/Context;

    move-result-object v6

    aput-object v6, v5, v10

    invoke-virtual {v4, v5}, Lcom/belkin/wemo/cache/devicelist/IconDownloader;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    goto :goto_0

    .line 257
    :cond_2
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->access$100(Lcom/belkin/wemo/cache/data/DevicesArray;)Ljava/util/Map;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->val$dev:Lcom/belkin/wemo/cache/devicelist/WeMoDevice;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/devicelist/WeMoDevice;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 259
    .local v0, "devInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->access$000(Lcom/belkin/wemo/cache/data/DevicesArray;)Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v1

    .line 260
    .local v1, "devMgr":Lcom/belkin/wemo/cache/devicelist/DeviceListManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_0

    .line 262
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;

    invoke-direct {v2, v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;-><init>(Lcom/belkin/wemo/cache/devicelist/DeviceListManager;Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 264
    .local v2, "req":Lcom/belkin/wemo/cache/cloud/CloudRequestGetIcon;
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v4, p0, Lcom/belkin/wemo/cache/data/DevicesArray$1;->this$0:Lcom/belkin/wemo/cache/data/DevicesArray;

    invoke-static {v4}, Lcom/belkin/wemo/cache/data/DevicesArray;->access$000(Lcom/belkin/wemo/cache/data/DevicesArray;)Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 266
    .local v3, "rm":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v3, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    goto :goto_0
.end method
