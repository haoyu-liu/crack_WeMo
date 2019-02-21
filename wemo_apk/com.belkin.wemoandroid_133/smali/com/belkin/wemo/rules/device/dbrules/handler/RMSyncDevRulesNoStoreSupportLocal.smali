.class public Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;
.super Ljava/lang/Object;
.source "RMSyncDevRulesNoStoreSupportLocal.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field protected device:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field protected errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

.field protected params:Ljava/util/HashMap;
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

.field protected rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field protected successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 31
    const-class v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Lcom/belkin/wemo/cache/data/DeviceInformation;Ljava/util/HashMap;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "device"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p3, "successCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;
    .param p4, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;
    .param p5, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
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
            "Lcom/belkin/wemo/rules/util/RMIRulesUtils;",
            ")V"
        }
    .end annotation

    .prologue
    .line 35
    .local p2, "params":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/Object;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    iput-object p3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    .line 37
    iput-object p4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    .line 42
    iput-object p1, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 43
    iput-object p2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->params:Ljava/util/HashMap;

    .line 44
    iput-object p5, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 45
    return-void
.end method

.method static synthetic access$000()Ljava/lang/String;
    .locals 1

    .prologue
    .line 23
    sget-object v0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    return-object v0
.end method

.method private setRulesDBVersionOnDevice()V
    .locals 8

    .prologue
    .line 52
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->params:Ljava/util/HashMap;

    const-string v2, "new_db_version"

    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/Integer;

    .line 54
    .local v7, "dbVersionToSet":Ljava/lang/Integer;
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getDevice()Lorg/cybergarage/upnp/Device;

    move-result-object v0

    const-string v2, "SetRulesDBVersion"

    invoke-virtual {v0, v2}, Lorg/cybergarage/upnp/Device;->getAction(Ljava/lang/String;)Lorg/cybergarage/upnp/Action;

    move-result-object v1

    .line 55
    .local v1, "action":Lorg/cybergarage/upnp/Action;
    new-instance v6, Ljava/util/HashMap;

    invoke-direct {v6}, Ljava/util/HashMap;-><init>()V

    .line 56
    .local v6, "argumentsHashMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v0, "RulesDBVersion"

    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v6, v0, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    new-instance v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;

    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    iget-object v2, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->successCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;

    iget-object v3, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    invoke-direct {v4, p0, v0, v2, v3}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;-><init>(Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;Ljava/lang/String;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesSuccesCallback;Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;)V

    .line 59
    .local v4, "callback":Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal$SetRulesDBVersionActionCallback;
    invoke-static {}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->newInstance()Lcom/belkin/wemo/controlaction/ControlActionHandler;

    move-result-object v0

    const/16 v2, 0x3a98

    const/16 v3, 0xfa0

    move-object v5, v4

    invoke-virtual/range {v0 .. v6}, Lcom/belkin/wemo/controlaction/ControlActionHandler;->postControlAction(Lorg/cybergarage/upnp/Action;IILcom/belkin/wemo/controlaction/callback/ControlActionErrorCallback;Lcom/belkin/wemo/controlaction/callback/ControlActionSuccessCallback;Ljava/util/Map;)V

    .line 65
    return-void
.end method


# virtual methods
.method public process()V
    .locals 1

    .prologue
    .line 48
    iget-object v0, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->device:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->writeDBFileToDevice(Ljava/lang/String;)V

    .line 49
    return-void
.end method

.method protected writeDBFileToDevice(Ljava/lang/String;)V
    .locals 7
    .param p1, "deviceUdn"    # Ljava/lang/String;

    .prologue
    .line 70
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v4, p1}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getRulesDBPathInDevice(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 71
    .local v1, "deviceDBPath":Ljava/lang/String;
    sget-object v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STORE RULES (No Store): Parsed DB Path of device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_1

    .line 74
    sget-object v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STORE RULES (No Store): Device DB path: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->params:Ljava/util/HashMap;

    const-string v5, "db_zip_file"

    invoke-virtual {v4, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 79
    .local v0, "dbZIPFilePath":Ljava/lang/String;
    :try_start_0
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const/16 v5, 0x2710

    invoke-interface {v4, v0, v1, v5}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->writeDBToDevice(Ljava/lang/String;Ljava/lang/String;I)V

    .line 80
    sget-object v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    const-string v5, "STORE RULES (No Store): Write DB File to Device SUCCESS"

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 94
    invoke-direct {p0}, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->setRulesDBVersionOnDevice()V

    .line 103
    .end local v0    # "dbZIPFilePath":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 81
    .restart local v0    # "dbZIPFilePath":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 83
    .local v2, "e":Ljava/io/IOException;
    sget-object v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    const-string v5, "STORE RULES (No Store): IOException while writing DB to device: "

    invoke-static {v4, v5, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 85
    new-instance v3, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v3, p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(Ljava/lang/String;)V

    .line 86
    .local v3, "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    invoke-virtual {v2}, Ljava/io/IOException;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;->setErrorMessage(Ljava/lang/String;)V

    .line 87
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v4, :cond_0

    .line 88
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    invoke-interface {v4, v3}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 98
    .end local v0    # "dbZIPFilePath":Ljava/lang/String;
    .end local v2    # "e":Ljava/io/IOException;
    .end local v3    # "error":Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;
    :cond_1
    sget-object v4, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "STORE RULES (No Store): GetRulesDBPath received is empty. device: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 99
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    if-eqz v4, :cond_0

    .line 100
    iget-object v4, p0, Lcom/belkin/wemo/rules/device/dbrules/handler/RMSyncDevRulesNoStoreSupportLocal;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;

    new-instance v5, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-direct {v5, p1}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(Ljava/lang/String;)V

    invoke-interface {v4, v5}, Lcom/belkin/wemo/rules/device/callback/RMStoreDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0
.end method
