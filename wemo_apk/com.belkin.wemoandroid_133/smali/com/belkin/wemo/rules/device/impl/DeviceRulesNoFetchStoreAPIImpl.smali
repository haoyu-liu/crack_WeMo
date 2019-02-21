.class Lcom/belkin/wemo/rules/device/impl/DeviceRulesNoFetchStoreAPIImpl;
.super Ljava/lang/Object;
.source "DeviceRulesNoFetchStoreAPIImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/IDeviceRules;


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fetchDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;)V
    .locals 1
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "callback"    # Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;

    .prologue
    .line 67
    if-eqz p1, :cond_1

    .line 68
    new-instance v0, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;

    invoke-direct {v0, p2, p1}, Lcom/belkin/wemo/rules/device/runnable/FetchDeviceRulesNoFetchSupportRunnable;-><init>(Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;Lorg/cybergarage/upnp/Device;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    .line 75
    :cond_0
    :goto_0
    return-void

    .line 70
    :cond_1
    if-eqz p2, :cond_0

    .line 71
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>()V

    invoke-interface {p2, v0}, Lcom/belkin/wemo/rules/device/callback/FetchDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    goto :goto_0
.end method

.method public storeDeviceRulesData(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V
    .locals 7
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "callback"    # Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;
    .param p3, "dbVersionToStore"    # Ljava/lang/String;
    .param p4, "localZippedDBFilePath"    # Ljava/lang/String;
    .param p5, "processDBState"    # I
    .param p6, "weeklyRecordArray"    # [Ljava/lang/String;

    .prologue
    .line 85
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    if-nez p1, :cond_2

    .line 86
    :cond_0
    if-eqz p2, :cond_1

    .line 87
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RuleDeviceError;-><init>()V

    invoke-interface {p2, v0}, Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;->onError(Lcom/belkin/wemo/rules/device/error/RuleDeviceError;)V

    .line 92
    :cond_1
    :goto_0
    return-void

    .line 90
    :cond_2
    new-instance v0, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;

    move-object v1, p2

    move-object v2, p1

    move-object v3, p3

    move-object v4, p4

    move v5, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/runnable/StoreDeviceRulesNoStoreSupportRunnable;-><init>(Lcom/belkin/wemo/rules/device/callback/StoreDeviceRulesCallback;Lorg/cybergarage/upnp/Device;Ljava/lang/String;Ljava/lang/String;I[Ljava/lang/String;)V

    invoke-static {v0}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeInBackground(Ljava/lang/Runnable;)V

    goto :goto_0
.end method
