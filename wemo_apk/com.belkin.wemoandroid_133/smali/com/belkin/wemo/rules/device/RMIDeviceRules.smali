.class public interface abstract Lcom/belkin/wemo/rules/device/RMIDeviceRules;
.super Ljava/lang/Object;
.source "RMIDeviceRules.java"


# static fields
.field public static final DO_NOT_PROCESS_DB:Ljava/lang/String; = "0"

.field public static final PROCESS_DB:Ljava/lang/String; = "1"


# virtual methods
.method public abstract fetchDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V
.end method

.method public abstract storeDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
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
.end method

.method public abstract syncDeviceRulesData(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
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
.end method
