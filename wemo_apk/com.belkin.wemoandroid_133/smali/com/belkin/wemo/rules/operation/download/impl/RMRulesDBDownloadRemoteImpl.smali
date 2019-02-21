.class public Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;
.super Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;
.source "RMRulesDBDownloadRemoteImpl.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 18
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 19
    return-void
.end method


# virtual methods
.method protected download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V
    .locals 2
    .param p1, "dowloadUrl"    # Ljava/lang/String;
    .param p2, "fileWithPath"    # Ljava/lang/String;
    .param p3, "deviceIdentifier"    # Ljava/lang/String;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    .prologue
    .line 27
    new-instance v0, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;

    new-instance v1, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;

    invoke-direct {v1, p0, p4, p5, p2}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;-><init>(Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;Ljava/lang/String;)V

    invoke-direct {v0, p3, v1}, Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;)V

    .line 28
    .local v0, "request":Lcom/belkin/wemo/cache/cloud/RMCloudRequestGetDBFile;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v1}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->getCloudRequestManager()Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 29
    return-void
.end method
