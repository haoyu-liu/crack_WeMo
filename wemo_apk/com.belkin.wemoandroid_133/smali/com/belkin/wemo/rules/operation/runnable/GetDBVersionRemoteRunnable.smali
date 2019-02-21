.class public Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "GetDBVersionRemoteRunnable.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# static fields
.field private static final REMOTE_DB_PATH_STUB:Ljava/lang/String; = "remote_db_path_not_required"

.field private static final TAG_DB_VERSION:Ljava/lang/String; = "dbVersion"

.field private static final TAG_PLUGIN:Ljava/lang/String; = "plugin"


# instance fields
.field private cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

.field private context:Landroid/content/Context;

.field private deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

.field private errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

.field private succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;Lcom/belkin/wemo/cache/data/DeviceInformation;Lcom/belkin/wemo/cache/cloud/CloudRequestManager;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;
    .param p3, "succesCallback"    # Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;
    .param p4, "deviceInfo"    # Lcom/belkin/wemo/cache/data/DeviceInformation;
    .param p5, "cloudRequestManager"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .prologue
    .line 40
    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    .line 42
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    .line 43
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    .line 44
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    .line 45
    iput-object p5, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->cloudRequestManager:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    .line 46
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->context:Landroid/content/Context;

    .line 47
    return-void
.end method

.method private parseResponse(Ljava/lang/String;)Ljava/lang/String;
    .locals 5
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 97
    new-instance v3, Lcom/belkin/wemo/cache/cloud/XMLParser;

    invoke-direct {v3}, Lcom/belkin/wemo/cache/cloud/XMLParser;-><init>()V

    .line 98
    .local v3, "parser":Lcom/belkin/wemo/cache/cloud/XMLParser;
    invoke-virtual {v3, p1}, Lcom/belkin/wemo/cache/cloud/XMLParser;->getDomElement(Ljava/lang/String;)Lorg/w3c/dom/Document;

    move-result-object v0

    .line 99
    .local v0, "doc":Lorg/w3c/dom/Document;
    const-string v4, "plugin"

    invoke-interface {v0, v4}, Lorg/w3c/dom/Document;->getElementsByTagName(Ljava/lang/String;)Lorg/w3c/dom/NodeList;

    move-result-object v2

    .line 100
    .local v2, "nl":Lorg/w3c/dom/NodeList;
    const/4 v4, 0x0

    invoke-interface {v2, v4}, Lorg/w3c/dom/NodeList;->item(I)Lorg/w3c/dom/Node;

    move-result-object v1

    check-cast v1, Lorg/w3c/dom/Element;

    .line 101
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

    .line 66
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "FetchRules Remote: Get DB Version from clour. Request completed for UDN: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v5}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 67
    if-eqz p1, :cond_1

    .line 69
    :try_start_0
    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p3, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 70
    .local v2, "response":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

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

    .line 73
    invoke-direct {p0, v2}, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->parseResponse(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 74
    .local v0, "dbVersionStr":Ljava/lang/String;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    if-eqz v3, :cond_0

    .line 75
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    const-string v5, "remote_db_path_not_required"

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v3, v4, v5, v6}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    .line 94
    .end local v0    # "dbVersionStr":Ljava/lang/String;
    .end local v2    # "response":Ljava/lang/String;
    :cond_0
    :goto_0
    return-void

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 79
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "UnsupportedEncodingException while encoding GetDBVersion cloud response: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 80
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-virtual {v1}, Ljava/io/UnsupportedEncodingException;->getMessage()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v7, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 82
    .end local v1    # "e":Ljava/io/UnsupportedEncodingException;
    :catch_1
    move-exception v1

    .line 83
    .local v1, "e":Ljava/lang/NumberFormatException;
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 84
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

    const-string v4, "UnsupportedEncodingException for db version received from cloud: "

    invoke-static {v3, v4, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 85
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->getMessage()Ljava/lang/String;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, v7, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto :goto_0

    .line 89
    .end local v1    # "e":Ljava/lang/NumberFormatException;
    :cond_1
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Error received while fetching rules DB version from cloud for device: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

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

    .line 90
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    if-eqz v3, :cond_0

    .line 91
    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->errorCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;

    new-instance v4, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;

    const-string v5, "Error while processing Rules!"

    iget-object v6, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v6}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4, p2, v5, v6}, Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesErrorCallback;->onError(Lcom/belkin/wemo/rules/device/error/RMRuleDeviceError;)V

    goto/16 :goto_0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 52
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v1}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getRulesDBVersion()I

    move-result v0

    .line 53
    .local v0, "dbVersionStr":I
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FetchRules Remote: UDN: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Rules DB Version: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    if-eqz v1, :cond_0

    .line 55
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->succesCallback:Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;

    const-string v2, "remote_db_path_not_required"

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/runnable/GetDBVersionRemoteRunnable;->deviceInfo:Lcom/belkin/wemo/cache/data/DeviceInformation;

    invoke-virtual {v3}, Lcom/belkin/wemo/cache/data/DeviceInformation;->getUDN()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v0, v2, v3}, Lcom/belkin/wemo/rules/device/callback/RMFetchDeviceRulesSuccesCallback;->onSuccess(ILjava/lang/String;Ljava/lang/String;)V

    .line 62
    :cond_0
    return-void
.end method
