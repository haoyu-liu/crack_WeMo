.class public Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;
.super Ljava/lang/Object;
.source "RMStoreRulesDBResponseHandler.java"

# interfaces
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeErrorCallback;
.implements Lcom/belkin/wemo/rules/operation/callback/RMStoreRulesTypeSuccessCallback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

.field private newRulesDBVersion:Ljava/lang/String;

.field private rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

.field private successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;Lcom/belkin/wemo/rules/util/RMIRulesUtils;Ljava/lang/String;)V
    .locals 1
    .param p1, "successCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;
    .param p2, "errorCallback"    # Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;
    .param p3, "rulesUtils"    # Lcom/belkin/wemo/rules/util/RMIRulesUtils;
    .param p4, "newRulesDBVersion"    # Ljava/lang/String;

    .prologue
    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 27
    const-class v0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    .line 33
    iput-object p1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;

    .line 34
    iput-object p2, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    .line 35
    iput-object p4, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->newRulesDBVersion:Ljava/lang/String;

    .line 36
    iput-object p3, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    .line 37
    return-void
.end method


# virtual methods
.method public onSingleTypeRulesStoreError(Lcom/belkin/wemo/rules/error/RMRulesTypeError;)V
    .locals 5
    .param p1, "error"    # Lcom/belkin/wemo/rules/error/RMRulesTypeError;

    .prologue
    .line 60
    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getRulesType()I

    move-result v1

    const/4 v2, 0x2

    if-ne v1, v2, :cond_0

    .line 62
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "DB Based Rule storing FAILED. Resetting DB Version."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v2, "0"

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 66
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v2, "1"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->copyRulesDB(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 74
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    if-eqz v1, :cond_1

    .line 75
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorCode()I

    move-result v3

    invoke-virtual {p1}, Lcom/belkin/wemo/rules/error/RMRulesTypeError;->getErrorMessage()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 77
    :cond_1
    return-void

    .line 67
    :catch_0
    move-exception v0

    .line 68
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "FileNotFoundException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 69
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 70
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "IOException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public onSingleTypeStoreFailed(ILjava/util/List;)V
    .locals 5
    .param p1, "RulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 82
    .local p2, "storeErrorUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 84
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "DB Based Rule storing FAILED. Resetting DB Version."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v2, "0"

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 88
    :try_start_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    const-string v2, "1"

    const-string v3, "0"

    invoke-interface {v1, v2, v3}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->copyRulesDB(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 96
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    if-eqz v1, :cond_1

    .line 97
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->errorCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;

    new-instance v2, Lcom/belkin/wemo/rules/error/RMRulesError;

    const/16 v3, -0x192

    const-string v4, "Rule could not be saved on ANY RULE device!"

    invoke-direct {v2, v3, v4}, Lcom/belkin/wemo/rules/error/RMRulesError;-><init>(ILjava/lang/String;)V

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesErrorCallback;->onStoreRulesFailed(Lcom/belkin/wemo/rules/error/RMRulesError;)V

    .line 100
    :cond_1
    return-void

    .line 89
    :catch_0
    move-exception v0

    .line 90
    .local v0, "e":Ljava/io/FileNotFoundException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "FileNotFoundException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0

    .line 91
    .end local v0    # "e":Ljava/io/FileNotFoundException;
    :catch_1
    move-exception v0

    .line 92
    .local v0, "e":Ljava/io/IOException;
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->TAG:Ljava/lang/String;

    const-string v2, "IOException while cloning rules DB: "

    invoke-static {v1, v2, v0}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public onSingleTypeStoreSuccess(ILjava/util/List;)V
    .locals 3
    .param p1, "RulesType"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 47
    .local p2, "storeErrorUDNList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    .line 48
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->rulesUtils:Lcom/belkin/wemo/rules/util/RMIRulesUtils;

    iget-object v2, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->newRulesDBVersion:Ljava/lang/String;

    invoke-interface {v1, v2}, Lcom/belkin/wemo/rules/util/RMIRulesUtils;->setRulesDBVersion(Ljava/lang/String;)V

    .line 49
    new-instance v0, Lcom/belkin/wemo/cache/utils/SharePreferences;

    sget-object v1, Lcom/belkin/wemo/WeMo;->INSTANCE:Lcom/belkin/wemo/WeMo;

    invoke-virtual {v1}, Lcom/belkin/wemo/WeMo;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;-><init>(Landroid/content/Context;)V

    .line 50
    .local v0, "sharePreferences":Lcom/belkin/wemo/cache/utils/SharePreferences;
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->newRulesDBVersion:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/cache/utils/SharePreferences;->setDBVersion(Ljava/lang/String;)V

    .line 53
    .end local v0    # "sharePreferences":Lcom/belkin/wemo/cache/utils/SharePreferences;
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;

    if-eqz v1, :cond_1

    .line 54
    iget-object v1, p0, Lcom/belkin/wemo/rules/store/handler/RMStoreRulesDBResponseHandler;->successCallback:Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;

    invoke-interface {v1}, Lcom/belkin/wemo/rules/store/callback/RMStoreRulesSuccessCallback;->onRulesStored()V

    .line 56
    :cond_1
    return-void
.end method
