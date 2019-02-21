.class Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesLocalOperationImpl;
.super Ljava/lang/Object;
.source "RMTNGRulesLocalOperationImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/RMIRulesOperation;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/belkin/wemo/rules/operation/RMIRulesOperation",
        "<",
        "Lcom/belkin/wemo/rules/data/RMTNGRule;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fetchRules(Ljava/util/List;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;)V
    .locals 0
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMFetchRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 24
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    return-void
.end method

.method public bridge synthetic storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 6
    .param p1, "x0"    # Ljava/util/List;
    .param p2, "x1"    # Lcom/belkin/wemo/rules/data/RMRule;
    .param p3, "x2"    # Ljava/util/HashMap;
    .param p4, "x3"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "x4"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;

    .prologue
    .line 16
    move-object v2, p2

    check-cast v2, Lcom/belkin/wemo/rules/data/RMTNGRule;

    move-object v0, p0

    move-object v1, p1

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/impl/RMTNGRulesLocalOperationImpl;->storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMTNGRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V

    return-void
.end method

.method public storeRules(Ljava/util/List;Lcom/belkin/wemo/rules/data/RMTNGRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;)V
    .locals 0
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMTNGRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Lcom/belkin/wemo/rules/data/RMTNGRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 44
    .local p1, "devicesList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-void
.end method

.method public syncRules(Ljava/util/List;Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;)V
    .locals 0
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/cache/data/DeviceInformation;",
            ">;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/callback/RMSyncRulesTypeErrorCallback;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p1, "devicesToSyncList":Ljava/util/List;, "Ljava/util/List<Lcom/belkin/wemo/cache/data/DeviceInformation;>;"
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    return-void
.end method
