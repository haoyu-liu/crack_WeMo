.class Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;
.super Ljava/lang/Object;
.source "RMFetchDevRulesNoFetchSupportLocal.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GetDBVersionActionCallback"
.end annotation


# instance fields
.field private deviceUdn:Ljava/lang/String;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Ljava/lang/String;)V
    .locals 0
    .param p2, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
    .param p5, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 68
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 69
    iput-object p5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    .line 70
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    .line 71
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .line 72
    return-void
.end method


# virtual methods
.method public onActionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 102
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 103
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 105
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 8
    .param p1, "responseXMLStr"    # Ljava/lang/String;

    .prologue
    .line 75
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "app_error"

    invoke-virtual {p1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 79
    :try_start_0
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    if-eqz v3, :cond_0

    .line 80
    new-instance v2, Lcom/belkin/wemo/upnp/parser/RMParser;

    invoke-direct {v2}, Lcom/belkin/wemo/upnp/parser/RMParser;-><init>()V

    .line 82
    .local v2, "parser":Lcom/belkin/wemo/upnp/parser/RMParser;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    invoke-static {v4}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->access$000(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;)Lorg/cybergarage/upnp/Device;

    move-result-object v4

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBPathInDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 83
    .local v0, "deviceRulesDBPath":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->this$0:Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;

    invoke-static {v4, v2, p1}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->access$100(Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;Lcom/belkin/wemo/upnp/parser/RMParser;Ljava/lang/String;)I

    move-result v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-interface {v3, v4, v0, v5}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 98
    .end local v0    # "deviceRulesDBPath":Ljava/lang/String;
    .end local v2    # "parser":Lcom/belkin/wemo/upnp/parser/RMParser;
    :cond_0
    :goto_0
    return-void

    .line 86
    :catch_0
    move-exception v1

    .line 87
    .local v1, "e":Ljava/lang/NumberFormatException;
    invoke-static {}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal;->access$200()Ljava/lang/String;

    move-result-object v3

    const-string v4, "Fetch Rules: No Fetch Support: NumberFormatException: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 89
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 90
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v5, -0x1

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->deviceUdn:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v7}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 94
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 95
    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesNoFetchSupportLocal$GetDBVersionActionCallback;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method
