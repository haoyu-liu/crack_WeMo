.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;
.super Ljava/lang/Object;
.source "RMFetchDevRulesFetchSupportLocal.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# instance fields
.field private device:Lorg/cybergarage/upnp/Device;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;


# direct methods
.method public constructor <init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .prologue
    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 28
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    .line 29
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .line 34
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    .line 35
    return-void
.end method


# virtual methods
.method public fetch()V
    .locals 6

    .prologue
    .line 38
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "FetchRules"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 40
    .local v1, "fetchRulesAction":Lorg/cybergarage/upnp/Action;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v4, p0

    move-object v5, p0

    invoke-virtual/range {v0 .. v5}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;)V

    .line 45
    return-void
.end method

.method public onActionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 70
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 73
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 7
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 49
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "app_error"

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 51
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMParser;

    invoke-direct {v0}, Lcom/belkin/wemo/upnp/parser/RMParser;-><init>()V

    .line 52
    .local v0, "parseResponse":Lcom/belkin/wemo/upnp/parser/RMParser;
    new-instance v1, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;-><init>()V

    .line 54
    .local v1, "responseObj":Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;
    const/16 v2, 0xb

    invoke-virtual {v0, v1, v2, p1}, Lcom/belkin/wemo/upnp/parser/RMParser;->uPnPResponseParser(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;ILjava/lang/String;)V

    .line 56
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    if-eqz v2, :cond_0

    .line 57
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->getRuleDBVersion()I

    move-result v3

    invoke-virtual {v1}, Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;->getRuleDBPath()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v5}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v2, v3, v4, v5}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V

    .line 65
    .end local v0    # "parseResponse":Lcom/belkin/wemo/upnp/parser/RMParser;
    .end local v1    # "responseObj":Lcom/belkin/wemo/upnp/response/RMFetchRulesResponse;
    :cond_0
    :goto_0
    return-void

    .line 60
    :cond_1
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v2, :cond_0

    .line 61
    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v3, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v4, -0x1

    const-string v5, "Error while processing Rules!"

    iget-object v6, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMFetchDevRulesFetchSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v6}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v2, v3}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method
