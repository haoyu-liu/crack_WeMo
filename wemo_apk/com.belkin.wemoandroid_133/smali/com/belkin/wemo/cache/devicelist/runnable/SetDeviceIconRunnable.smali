.class public Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "SetDeviceIconRunnable.java"


# instance fields
.field private context:Landroid/content/Context;

.field private devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

.field private iconLocation:Ljava/lang/String;

.field private udn:Ljava/lang/String;

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "udn"    # Ljava/lang/String;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "iconLocation"    # Ljava/lang/String;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 23
    invoke-static {p1}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    .line 24
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->context:Landroid/content/Context;

    .line 25
    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->udn:Ljava/lang/String;

    .line 26
    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->url:Ljava/lang/String;

    .line 27
    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->iconLocation:Ljava/lang/String;

    .line 28
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .prologue
    .line 33
    :try_start_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6}, Lcom/belkin/wemo/cache/data/DevicesArray;->getDeviceInformation(Ljava/lang/String;)Lcom/belkin/wemo/cache/data/DeviceInformation;

    move-result-object v0

    .line 34
    .local v0, "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    const/4 v3, 0x0

    .line 35
    .local v3, "result":Z
    if-eqz v0, :cond_1

    .line 37
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->url:Ljava/lang/String;

    iget-object v6, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->iconLocation:Ljava/lang/String;

    invoke-static {v6}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->readFile(Ljava/lang/String;)[B

    move-result-object v6

    const/16 v7, 0x3a98

    invoke-static {v5, v6, v7}, Lcom/belkin/wemo/cache/utils/UploadFileUtil;->uploadFileToDevice(Ljava/lang/String;[BI)Z

    .line 38
    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getIconVersion()Ljava/lang/String;

    move-result-object v4

    .line 39
    .local v4, "strIconVersion":Ljava/lang/String;
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 41
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/lit8 v2, v5, 0x1

    .line 42
    .local v2, "iconVersion":I
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIconVersion(Ljava/lang/String;)V

    .line 43
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->iconLocation:Ljava/lang/String;

    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->setIcon(Ljava/lang/String;)V

    .line 44
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/data/DevicesArray;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/data/DevicesArray;

    move-result-object v5

    invoke-virtual {v5, v0}, Lcom/belkin/wemo/cache/data/DevicesArray;->addOrUpdateDeviceInformation(Lcom/belkin/wemo/cache/data/DeviceInformation;)V

    .line 45
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/CacheManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/CacheManager;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-virtual {v5, v0, v6, v7, v8}, Lcom/belkin/wemo/cache/CacheManager;->updateDB(Lcom/belkin/wemo/cache/data/DeviceInformation;ZZZ)V

    .line 46
    const/4 v3, 0x1

    .line 51
    .end local v2    # "iconVersion":I
    .end local v4    # "strIconVersion":Ljava/lang/String;
    :cond_0
    :goto_0
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->devListManager:Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    const-string v6, "update"

    invoke-static {v3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    move-result-object v7

    iget-object v8, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->udn:Ljava/lang/String;

    invoke-virtual {v5, v6, v7, v8}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->sendNotification(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "result":Z
    :goto_1
    return-void

    .line 49
    .restart local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .restart local v3    # "result":Z
    :cond_1
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->TAG:Ljava/lang/String;

    const-string v6, "SetDeviceIconRunnable: FAILED to change state as DeviceInfo Object is NULL."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 52
    .end local v0    # "deviceInfo":Lcom/belkin/wemo/cache/data/DeviceInformation;
    .end local v3    # "result":Z
    :catch_0
    move-exception v1

    .line 53
    .local v1, "exception":Ljava/lang/NumberFormatException;
    iget-object v5, p0, Lcom/belkin/wemo/cache/devicelist/runnable/SetDeviceIconRunnable;->TAG:Ljava/lang/String;

    const-string v6, "SetDeviceIconRunnable: Number format exception."

    invoke-static {v5, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1
.end method
