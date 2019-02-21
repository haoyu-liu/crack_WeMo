.class Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;
.super Ljava/lang/Object;
.source "RMRulesDBDownloadRemoteImpl.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/listener/OnRequestCompleteListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DownloadDBRequestListener"
.end annotation


# instance fields
.field private errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

.field private rulesDBFileWithPath:Ljava/lang/String;

.field private successCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;

.field final synthetic this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;Ljava/lang/String;)V
    .locals 0
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;
    .param p4, "rulesDBFileWithPath"    # Ljava/lang/String;

    .prologue
    .line 38
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput-object p2, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->successCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;

    .line 40
    iput-object p3, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    .line 41
    iput-object p4, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->rulesDBFileWithPath:Ljava/lang/String;

    .line 42
    return-void
.end method


# virtual methods
.method public onRequestComplete(ZI[B)V
    .locals 4
    .param p1, "success"    # Z
    .param p2, "statusCode"    # I
    .param p3, "resp"    # [B

    .prologue
    .line 47
    if-eqz p1, :cond_1

    .line 49
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    iget-object v1, v1, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Fetch Rules: Remote: Location for Downloading rules DB from cloud: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->rulesDBFileWithPath:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    iget-object v1, v1, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->rulesDBFileWithPath:Ljava/lang/String;

    invoke-interface {v1, p3, v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->downloadFromUrl([BLjava/lang/String;)V

    .line 51
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->successCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;

    if-eqz v1, :cond_0

    .line 52
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->successCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;

    iget-object v2, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->rulesDBFileWithPath:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;->onRulesDBDownloaded(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 66
    :cond_0
    :goto_0
    return-void

    .line 54
    :catch_0
    move-exception v0

    .line 55
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    iget-object v1, v1, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;->TAG:Ljava/lang/String;

    const-string v2, "IOException while downloading rules DB from cloud: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 56
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    if-eqz v1, :cond_0

    .line 57
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    invoke-interface {v1, v0}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;->onRulesDBDownloadException(Ljava/lang/Exception;)V

    goto :goto_0

    .line 61
    .end local v0    # "e":Ljava/io/IOException;
    :cond_1
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->this$0:Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;

    iget-object v1, v1, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Error received while downloading rules DB from cloud. STATUS CODE: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    if-eqz v1, :cond_0

    .line 63
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadRemoteImpl$DownloadDBRequestListener;->errorCallback:Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    new-instance v2, Lcom/belkin/wemo/localsdk/exception/RulesException;

    const-string v3, "DB Download failed"

    invoke-direct {v2, v3}, Lcom/belkin/wemo/localsdk/exception/RulesException;-><init>(Ljava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;->onRulesDBDownloadException(Ljava/lang/Exception;)V

    goto :goto_0
.end method
