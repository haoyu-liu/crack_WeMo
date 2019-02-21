.class Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;
.super Ljava/lang/Object;
.source "RMSyncDevRulesNoStoreSupportLocal.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SetRulesDBVersionActionCallback"
.end annotation


# instance fields
.field private deviceUdn:Ljava/lang/String;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;Ljava/lang/String;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    .prologue
    .line 114
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    .line 116
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    .line 117
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    .line 118
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 129
    invoke-static {}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE RULES (No Store): Setting Rules DB version to Device FAILED. Device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 131
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 133
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 122
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;->onSuccess(Ljava/lang/String;)V

    .line 125
    :cond_0
    return-void
.end method
