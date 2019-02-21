.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;
.super Ljava/lang/Object;
.source "RMSyncDevRulesStoreSupportLocal.java"

# interfaces
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;
.implements Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;


# static fields
.field public static final TAG:Ljava/lang/String;


# instance fields
.field private device:Lorg/cybergarage/upnp/Device;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

.field private params:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private processDB:I

.field private rule:Lcom/belkin/wemo/rules/data/RMDBRule;

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field private successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    const-class v0, Lcom/belkin/wemo/rules/util/RMRulesUtility;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lorg/cybergarage/upnp/Device;Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "device"    # Lorg/cybergarage/upnp/Device;
    .param p2, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .param p6, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/cybergarage/upnp/Device;",
            "Lcom/belkin/wemo/rules/data/RMDBRule;",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;",
            "Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;",
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 42
    .local p3, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    .line 44
    iput-object p5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    .line 49
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    .line 50
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    .line 51
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->params:Ljava/util/HashMap;

    .line 52
    iput-object p6, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 53
    return-void
.end method

.method private parseControlActionResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;
    .locals 3
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 147
    new-instance v0, Lcom/belkin/wemo/upnp/parser/RMParser;

    invoke-direct {v0}, Lcom/belkin/wemo/upnp/parser/RMParser;-><init>()V

    .line 148
    .local v0, "parseResponse":Lcom/belkin/wemo/upnp/parser/RMParser;
    new-instance v1, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;

    invoke-direct {v1}, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;-><init>()V

    .line 150
    .local v1, "responseObj":Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;
    const/16 v2, 0xc

    invoke-virtual {v0, v1, v2, p1}, Lcom/belkin/wemo/upnp/parser/RMParser;->uPnPResponseParser(Lcom/belkin/wemo/upnp/response/RMBaseUpnpResponse;ILjava/lang/String;)V

    .line 152
    return-object v1
.end method

.method private sendResponseViaCallbacks(Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;)V
    .locals 4
    .param p1, "responseObj"    # Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;

    .prologue
    .line 131
    invoke-virtual {p1}, Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;->getErrorInfo()Ljava/lang/String;

    move-result-object v0

    .line 133
    .local v0, "errorInfo":Ljava/lang/String;
    const-string v1, "Storing of rules DB Successful!"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 134
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    if-eqz v1, :cond_0

    .line 135
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;->onSuccess(Ljava/lang/String;)V

    .line 144
    :cond_0
    :goto_0
    return-void

    .line 139
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v1, :cond_0

    .line 140
    iget-object v1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method


# virtual methods
.method protected getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "rule"    # Lcom/belkin/wemo/rules/data/RMDBRule;
    .param p2, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 105
    iget v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->processDB:I

    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public onActionError(Ljava/lang/Exception;)V
    .locals 5
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 122
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const/4 v2, -0x1

    invoke-virtual {p1}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v4}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 125
    :cond_0
    return-void
.end method

.method public onActionSuccess(Ljava/lang/String;)V
    .locals 3
    .param p1, "responseXML"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 111
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v1, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v2}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v1}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 117
    :cond_0
    :goto_0
    return-void

    .line 115
    :cond_1
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->parseControlActionResponse(Ljava/lang/String;)Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->sendResponseViaCallbacks(Lcom/belkin/wemo/upnp/response/RMStoreRulesResponse;)V

    goto :goto_0
.end method

.method public process()V
    .locals 13

    .prologue
    .line 56
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->params:Ljava/util/HashMap;

    const-string v2, "db_zip_file"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 57
    .local v9, "dbZIPFileInApp":Ljava/lang/String;
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->params:Ljava/util/HashMap;

    const-string v2, "new_db_version"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    .line 58
    .local v8, "dbVersionToSet":Ljava/lang/Integer;
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->params:Ljava/util/HashMap;

    const-string v2, "process_db"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v12

    .line 59
    .local v12, "processDBObj":Ljava/lang/Object;
    if-eqz v12, :cond_0

    .line 60
    check-cast v12, Ljava/lang/Integer;

    .end local v12    # "processDBObj":Ljava/lang/Object;
    invoke-virtual {v12}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iput v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->processDB:I

    .line 63
    :cond_0
    const-string v7, ""

    .line 65
    .local v7, "dbInBase64Encoding":Ljava/lang/String;
    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v0, v9}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getFileInBase64Encoding(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Lcom/belkin/wemo/exception/InvalidArgumentsException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v7

    .line 76
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 78
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_1

    .line 79
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v2}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>()V

    invoke-interface {v0, v2}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    .line 102
    :cond_1
    :goto_0
    return-void

    .line 66
    :catch_0
    move-exception v10

    .line 67
    .local v10, "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->TAG:Ljava/lang/String;

    const-string v2, "Store single device rule (local): InvalidArgumentsException while converting db zip to base64 encoding."

    invoke-static {v0, v2, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 68
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v0, :cond_1

    .line 69
    new-instance v11, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v0}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v11, v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(Ljava/lang/String;)V

    .line 70
    .local v11, "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    invoke-virtual {v10}, Lcom/belkin/wemo/exception/InvalidArgumentsException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v11, v0}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->setErrorMessage(Ljava/lang/String;)V

    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    invoke-interface {v0, v11}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 82
    .end local v10    # "e":Lcom/belkin/wemo/exception/InvalidArgumentsException;
    .end local v11    # "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    :cond_2
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    const-string v2, "StoreRules"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 84
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 87
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "ruleDbVersion"

    invoke-static {v8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 90
    const-string v0, "processDb"

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->rule:Lcom/belkin/wemo/rules/data/RMDBRule;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->device:Lorg/cybergarage/upnp/Device;

    invoke-virtual {v3}, Lorg/cybergarage/upnp/Device;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p0, v2, v3}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesStoreSupportLocal;->getProcessDBValue(Lcom/belkin/wemo/rules/data/RMDBRule;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 93
    const-string v0, "ruleDbBody"

    invoke-virtual {v6, v0, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 95
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v4, p0

    move-object v5, p0

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;Ljava/util/Map;)V

    goto :goto_0
.end method
