.class public Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;
.super Ljava/lang/Object;
.source "RMDeviceRulesDBNoFetchSupportImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/RMIDeviceRules;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private ruleUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 23
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "ruleUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 28
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->ruleUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 30
    return-void
.end method


# virtual methods
.method public fetchDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V
    .locals 3
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .prologue
    .line 36
    if-eqz p1, :cond_2

    .line 37
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v0

    .line 38
    .local v0, "device":Lorg/cybergarage/upnp/Device;
    if-eqz v0, :cond_1

    .line 39
    new-instance v1, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->ruleUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-direct {v1, v0, p2, p3, v2}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;-><init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v1}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->fetch()V

    .line 53
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_0
    :goto_0
    return-void

    .line 41
    .restart local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_1
    if-eqz p3, :cond_0

    .line 42
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: for single DB device (NO FETCH) via local. Device object inside DeviceInformation is NULL."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 47
    .end local v0    # "device":Lorg/cybergarage/upnp/Device;
    :cond_2
    if-eqz p3, :cond_0

    .line 48
    sget-object v1, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v2, "Fetch Rules: for single DB device (NO FETCH) via local. DeviceInformation object is NULL."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p3, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method

.method public storeDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 8
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
    .line 98
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v7, 0x0

    .line 99
    .local v7, "device":Lorg/cybergarage/upnp/Device;
    if-eqz p1, :cond_1

    .line 100
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v7

    .line 101
    if-nez v7, :cond_2

    .line 102
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (No STORE support) via local. Device object inside DeviceInformation is NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    if-eqz p5, :cond_0

    .line 104
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 131
    :cond_0
    :goto_0
    return-void

    .line 109
    :cond_1
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (NO STORE) via local. DeviceInformation object is NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    if-eqz p5, :cond_0

    .line 111
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 116
    :cond_2
    if-nez p2, :cond_3

    .line 117
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (No STORE support) via local. Rule Object is NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    if-eqz p5, :cond_0

    .line 119
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 123
    :cond_3
    if-nez p3, :cond_4

    .line 124
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (No STORE support) via local. params are NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    if-eqz p5, :cond_0

    .line 126
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 130
    :cond_4
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    iget-object v6, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->ruleUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->process()V

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
    .line 62
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    const/4 v6, 0x0

    .line 63
    .local v6, "device":Lorg/cybergarage/upnp/Device;
    if-eqz p1, :cond_1

    .line 64
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v6

    .line 65
    if-nez v6, :cond_2

    .line 66
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (No STORE support) via local. Device object inside DeviceInformation is NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    if-eqz p4, :cond_0

    .line 68
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 90
    :cond_0
    :goto_0
    return-void

    .line 73
    :cond_1
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (NO STORE) via local. DeviceInformation object is NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    if-eqz p4, :cond_0

    .line 75
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 81
    :cond_2
    if-nez p2, :cond_3

    .line 82
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->TAG:Ljava/lang/String;

    const-string v1, "Store Rules: for single DB device (No STORE support) via local. params are NULL."

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    if-eqz p4, :cond_0

    .line 84
    new-instance v0, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {p4, v0}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 89
    :cond_3
    new-instance v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/dbrules/RMDeviceRulesDBNoFetchSupportImpl;->ruleUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;-><init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    invoke-virtual {v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->process()V

    goto :goto_0
.end method
