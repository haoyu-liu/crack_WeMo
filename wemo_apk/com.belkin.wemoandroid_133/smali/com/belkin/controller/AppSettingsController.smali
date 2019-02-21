.class public Lcom/belkin/controller/AppSettingsController;
.super Ljava/lang/Object;
.source "AppSettingsController.java"


# static fields
.field public static final TAG:Ljava/lang/String; = "AppSettingsController"

.field private static appSettingsController:Lcom/belkin/controller/AppSettingsController;


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 16
    const/4 v0, 0x0

    sput-object v0, Lcom/belkin/controller/AppSettingsController;->appSettingsController:Lcom/belkin/controller/AppSettingsController;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/controller/AppSettingsController;->mContext:Landroid/content/Context;

    .line 32
    iput-object p1, p0, Lcom/belkin/controller/AppSettingsController;->mContext:Landroid/content/Context;

    .line 33
    return-void
.end method

.method public static declared-synchronized getInstance(Landroid/content/Context;)Lcom/belkin/controller/AppSettingsController;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 25
    const-class v1, Lcom/belkin/controller/AppSettingsController;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/controller/AppSettingsController;->appSettingsController:Lcom/belkin/controller/AppSettingsController;

    if-nez v0, :cond_0

    .line 26
    new-instance v0, Lcom/belkin/controller/AppSettingsController;

    invoke-direct {v0, p0}, Lcom/belkin/controller/AppSettingsController;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/controller/AppSettingsController;->appSettingsController:Lcom/belkin/controller/AppSettingsController;

    .line 28
    :cond_0
    sget-object v0, Lcom/belkin/controller/AppSettingsController;->appSettingsController:Lcom/belkin/controller/AppSettingsController;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 25
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public reportAProblem(Lorg/json/JSONArray;)Ljava/lang/String;
    .locals 8
    .param p1, "inParamArray"    # Lorg/json/JSONArray;

    .prologue
    .line 37
    :try_start_0
    const-string v5, "AppSettingsController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "In AppSettingsController: inParamArray: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {p1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;

    invoke-direct {v2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;-><init>(Lorg/json/JSONArray;)V

    .line 39
    .local v2, "request":Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;
    new-instance v3, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v5, p0, Lcom/belkin/controller/AppSettingsController;->mContext:Landroid/content/Context;

    invoke-direct {v3, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;-><init>(Landroid/content/Context;)V

    .line 40
    .local v3, "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    invoke-virtual {v3, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;)[Ljava/lang/String;

    move-result-object v4

    .line 41
    .local v4, "result":[Ljava/lang/String;
    if-eqz v4, :cond_0

    array-length v5, v4

    if-lez v5, :cond_0

    .line 42
    const-string v5, "AppSettingsController"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "In AppSettingsController: result: statusCode: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x0

    aget-object v7, v4, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, " response: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const/4 v7, 0x1

    aget-object v7, v4, v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 44
    .local v1, "finalResult":Lorg/json/JSONObject;
    const-string v5, "statusCode"

    const/4 v6, 0x0

    aget-object v6, v4, v6

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 45
    const-string v5, "response"

    const/4 v6, 0x1

    aget-object v6, v4, v6

    invoke-virtual {v1, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v5

    .line 51
    .end local v1    # "finalResult":Lorg/json/JSONObject;
    .end local v2    # "request":Lcom/belkin/wemo/cache/cloud/CloudRequestForSalesforce;
    .end local v3    # "requestManager":Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .end local v4    # "result":[Ljava/lang/String;
    :goto_0
    return-object v5

    .line 48
    :catch_0
    move-exception v0

    .line 49
    .local v0, "e":Ljava/lang/Exception;
    const-string v5, "AppSettingsController"

    const-string v6, "Caught an Exception in AppSettingsController: reportAProblem: "

    invoke-static {v5, v6, v0}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 51
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_0
    const/4 v5, 0x0

    goto :goto_0
.end method
