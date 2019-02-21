.class public Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;
.super Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;
.source "RMRulesDBDownloadLocalImpl.java"


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 0
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 14
    invoke-direct {p0, p1}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;-><init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V

    .line 15
    return-void
.end method


# virtual methods
.method protected download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V
    .locals 4
    .param p1, "dowloadUrl"    # Ljava/lang/String;
    .param p2, "filename"    # Ljava/lang/String;
    .param p3, "deviceIdentifier"    # Ljava/lang/String;
    .param p4, "successCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;
    .param p5, "errorCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;

    .prologue
    .line 23
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    invoke-interface {v1, p1, p2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->downloadFromUrl(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    if-eqz p4, :cond_0

    .line 25
    invoke-interface {p4, p2}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;->onRulesDBDownloaded(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 38
    :cond_0
    :goto_0
    return-void

    .line 27
    :catch_0
    move-exception v0

    .line 28
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "FileNotFoundException while downloading from URL: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 29
    if-eqz p5, :cond_0

    .line 30
    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;->onRulesDBDownloadException(Ljava/lang/Exception;)V

    goto :goto_0

    .line 32
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 33
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadLocalImpl;->TAG:Ljava/lang/String;

    const-string v2, "IOException while downloading from URL: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 34
    if-eqz p5, :cond_0

    .line 35
    invoke-interface {p5, v0}, Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;->onRulesDBDownloadException(Ljava/lang/Exception;)V

    goto :goto_0
.end method
