.class public Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;
.super Ljava/lang/Object;
.source "RMDeviceRulesDBFetchSupportImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/RMIDeviceRules;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "ruleUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 28
    return-void
.end method


# virtual methods
.method public fetchDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V
    .locals 3
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .prologue
    .line 34
    if-eqz p1, :cond_2

    .line 35
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 36
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_1

    .line 37
    new-instance v1, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;

    invoke-direct {v1, v0, p2, p3}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->fetch()V

    .line 50
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 39
    .restart local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    if-eqz p3, :cond_0

    .line 40
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: for single DB device (FETCH supported) via local. Device object inside DeviceInformation is NULL."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 45
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-eqz p3, :cond_0

    .line 46
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: for single DB device (FETCH supported) via local. DeviceInformation object is NULL."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method

.method public storeDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 7
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 90
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 91
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-nez p1, :cond_1

    .line 92
    if-eqz p5, :cond_0

    .line 93
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: for single DB device (STORE supported) via local. DeviceInformation is NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 118
    :cond_0
    :goto_0
    return-void

    .line 96
    :cond_1
    if-nez p2, :cond_2

    .line 97
    if-eqz p5, :cond_0

    .line 98
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: for single DB device (STORE supported) via local. Rule Object is NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 101
    :cond_2
    if-nez p3, :cond_3

    .line 102
    if-eqz p5, :cond_0

    .line 103
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: for single DB device (STORE supported) via local. params are NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 107
    :cond_3
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 108
    if-nez v1, :cond_4

    .line 109
    if-eqz p5, :cond_0

    .line 110
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: for single DB device (STORE supported) via local. uPnP Device object inside DeviceInformation is NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 114
    :cond_4
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal;

    iget-object v6, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesStoreSupportLocal;->process()V

    goto :goto_0
.end method

.method public syncDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 7
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 58
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v1, 0x0

    .line 59
    .local v1, "device":Lorg/cybergarage/upnp/Device;
    if-nez p1, :cond_1

    .line 60
    if-eqz p4, :cond_0

    .line 61
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: Sync for single DB device (STORE supported) via local. DeviceInformation is NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 81
    :cond_0
    :goto_0
    return-void

    .line 64
    :cond_1
    if-nez p2, :cond_2

    .line 65
    if-eqz p4, :cond_0

    .line 66
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: Sync for single DB device (STORE supported) via local. params are NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 70
    :cond_2
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v1

    .line 71
    if-nez v1, :cond_3

    .line 72
    if-eqz p4, :cond_0

    .line 73
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Store Rules: Sync for single DB device (STORE supported) via local. uPnP Device object inside DeviceInformation is NULL."

    invoke-static {v0, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 77
    :cond_3
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;

    const/4 v2, 0x0

    iget-object v6, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBFetchSupportImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->process()V

    goto :goto_0
.end method
