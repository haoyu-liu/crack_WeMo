.class public Lcom/belkin/wemo/rules/device/tngrules/RMDeviceRulesTNGImpl;
.super Ljava/lang/Object;
.source "RMDeviceRulesTNGImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/device/RMIDeviceRules;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fetchDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V
    .locals 0
    .param p1, "deviceInformation"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .prologue
    .line 64
    return-void
.end method

.method public storeDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
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
    .line 82
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-void
.end method

.method public syncDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
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
    .line 73
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-void
.end method
