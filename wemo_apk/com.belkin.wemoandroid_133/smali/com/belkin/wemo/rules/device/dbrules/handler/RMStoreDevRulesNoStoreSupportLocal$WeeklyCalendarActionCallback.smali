.class Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;
.super Ljava/lang/Object;
.source "RMStoreDevRulesNoStoreSupportLocal.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "WeeklyCalendarActionCallback"
.end annotation


# instance fields
.field protected deviceUdn:Ljava/lang/String;

.field final synthetic this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;Ljava/lang/String;)V
    .locals 0
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->deviceUdn:Ljava/lang/String;

    .line 87
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 96
    invoke-static {}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "STORE RULES (No Store): Update Weekly calendar call failed, device: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    iget-object v0, v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 98
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    iget-object v0, v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 100
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 2
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 91
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal$WeeklyCalendarActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;

    iget-object v1, v1, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMStoreDevRulesNoStoreSupportLocal;->writeDBFileToDevice(Ljava/lang/String;)V

    .line 92
    return-void
.end method
