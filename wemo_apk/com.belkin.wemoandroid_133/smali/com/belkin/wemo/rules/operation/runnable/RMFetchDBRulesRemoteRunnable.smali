.class public Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "RMFetchDBRulesRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# static fields
.field private static final REMOTE_DB_PATH_STUB:Ljava/lang/String; = "remote_db_path_not_required"

.field private static final TAG_DB_VERSION:Ljava/lang/String; = "dbVersion"

.field private static final TAG_PLUGIN:Ljava/lang/String; = "plugin"


# instance fields
.field private cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

.field private deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

.field private succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/cloud/CloudRequestManager;)V
    .locals 0
    .param p1, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
    .param p2, "succesCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p3, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p4, "cloudRequestManager"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 38
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 39
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .line 40
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .line 42
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 83
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 84
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 85
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v4, "plugin"

    invoke-interface {v0, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 86
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v4, 0x0

    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 87
    .local v1, "e":Lorg/w3c/dom/Element;
    const-string v4, "dbVersion"

    invoke-virtual {v3, v1, v4}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getValue(Lorg/w3c/dom/Element;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 8
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    const/4 v7, -0x1

    .line 53
    if-eqz p1, :cond_1

    .line 55
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 56
    .local v2, "response":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "GetDBVersion cloud resposne: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    invoke-direct {p0, v2}, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 60
    .local v0, "dbVersionStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    if-eqz v3, :cond_0

    .line 61
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "remote_db_path_not_required"

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 80
    .end local v0    # "dbVersionStr":Ljava/lang/String;
    .end local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 63
    :catch_0
    move-exception v1

    .line 64
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 65
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "UnsupportedEncodingException while encoding GetDBVersion cloud response: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 66
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v7, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 68
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 69
    .local v1, "e":Ljava/lang/NumberFormatException;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 70
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "UnsupportedEncodingException for db version received from cloud: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 71
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v7, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 75
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error received while fetching rules DB version from cloud for device: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "; STATUS CODE: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 77
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const-string v5, "Error while processing Rules!"

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, p2, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto/16 :goto_0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 47
    new-instance v0, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;

    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getPluginID()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v2}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getMAC()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getModelCode()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3, p0}, Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 48
    .local v0, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestGetDBVersion;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/RMFetchDBRulesRemoteRunnable;->cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 49
    return-void
.end method
