.class public abstract Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;
.super Ljava/lang/Object;
.source "RMRulesDBDownloadAbstractImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/download/RMIRulesDBDownloader;


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/util/RMIRulesUtils;)V
    .locals 1
    .param p1, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .prologue
    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;->TAG:Ljava/lang/String;

    .line 22
    iput-object p1, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 23
    return-void
.end method


# virtual methods
.method protected abstract download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V
.end method

.method public downloadRulesDB(Ljava/util/HashMap;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V
    .locals 6
    .param p2, "successCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;
    .param p3, "errorCallback"    # Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;",
            "Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/belkin/wemo/exception/InvalidArgumentsException;
        }
    .end annotation

    .prologue
    .line 30
    .local p1, "dataMap":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz p1, :cond_2

    .line 31
    const-string v0, "download_url"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 32
    .local v1, "dowloadUrl":Ljava/lang/String;
    const-string v0, "download_location"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 33
    .local v2, "filename":Ljava/lang/String;
    const-string v0, "mac_address"

    invoke-virtual {p1, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 35
    .local v3, "deviceIdentifier":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;->TAG:Ljava/lang/String;

    const-string v4, "Unable to download Rules DB from URL as download location or URL are invalid."

    invoke-static {v0, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v4, "Input data for downloading DB is not valid."

    invoke-direct {v0, v4}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    move-object v0, p0

    move-object v4, p2

    move-object v5, p3

    .line 39
    invoke-virtual/range {v0 .. v5}, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;->download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadSuccessCallback;Lcom/belkin/wemo/rules/operation/download/callback/RMRulesDBDownloadErrorCallback;)V

    .line 46
    return-void

    .line 43
    .end local v1    # "dowloadUrl":Ljava/lang/String;
    .end local v2    # "filename":Ljava/lang/String;
    .end local v3    # "deviceIdentifier":Ljava/lang/String;
    :cond_2
    iget-object v0, p0, Lcom/belkin/wemo/rules/operation/download/impl/RMRulesDBDownloadAbstractImpl;->TAG:Ljava/lang/String;

    const-string v4, "Unable to download Rules DB from URL as dataMap is Null"

    invoke-static {v0, v4}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    new-instance v0, Lcom/belkin/wemo/exception/InvalidArgumentsException;

    const-string v4, "Input data for downloading DB is not valid."

    invoke-direct {v0, v4}, Lcom/belkin/wemo/exception/InvalidArgumentsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
