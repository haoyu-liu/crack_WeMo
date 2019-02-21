.class public Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
.super Ljava/lang/Object;
.source "CloudRequestManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;,
        Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    }
.end annotation


# static fields
.field public static final DEFAULT_CLOUD_REQUEST_RETRIES:I = 0x1

.field public static final DEFAULT_CLOUD_REQUEST_TIMEOUT_MS:I = 0xea60


# instance fields
.field private final CONTENT_TYPE:Ljava/lang/String;

.field private final TAG:Ljava/lang/String;

.field private final USER_AGENT:Ljava/lang/String;

.field private context:Landroid/content/Context;

.field private httpConn:Ljava/net/HttpURLConnection;

.field private networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

.field private outputStream:Ljava/io/OutputStream;

.field private response:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private status:I

.field private writer:Ljava/io/PrintWriter;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    const-string v0, "Content-Type"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->CONTENT_TYPE:Ljava/lang/String;

    .line 51
    const-string v0, "User-Agent"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->USER_AGENT:Ljava/lang/String;

    .line 52
    const-string v0, "SDK_CloudRequestManager"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->TAG:Ljava/lang/String;

    .line 58
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->response:Ljava/util/List;

    .line 66
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    .line 67
    new-instance v0, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-direct {v0, p1}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    .line 68
    return-void
.end method

.method static synthetic access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 0
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
    .param p1, "x1"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 49
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->issuePeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    return-void
.end method

.method private handleUnauthorizedRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 3
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 425
    const-string v0, "SDK_CloudRequestManager"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cloud Request: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " is NOT AUTHORISED. REQUEST CANCELLED"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 426
    const/4 v0, 0x0

    const/16 v1, -0x195

    const/4 v2, 0x0

    invoke-interface {p1, v0, v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    .line 427
    return-void
.end method

.method private isRequestAuthorized(Ljava/lang/String;)Z
    .locals 3
    .param p1, "authHeader"    # Ljava/lang/String;

    .prologue
    .line 241
    const/4 v0, 0x0

    .line 242
    .local v0, "isAvailable":Z
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 243
    const/4 v0, 0x1

    .line 247
    :goto_0
    return v0

    .line 245
    :cond_0
    const-string v1, "SDK_CloudRequestManager"

    const-string v2, "Cloud request is not authorised as Auth Header is emmpty."

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private issuePeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 2
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 430
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    .line 431
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->instance()Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->onRequestCompleted()I

    move-result v0

    if-nez v0, :cond_0

    .line 432
    const-string v0, "SDK_CloudRequestManager"

    const-string v1, "STARTING PERIODIC UPDATE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 433
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->startCloudPeriodicUpdate()V

    .line 437
    :cond_0
    return-void
.end method

.method private logCloudRequest(Lcom/android/volley/Request;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/Request",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 400
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<*>;"
    if-eqz p1, :cond_0

    invoke-static {}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->isDebug()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 401
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    .line 405
    .local v5, "requestClassStr":Ljava/lang/String;
    :try_start_0
    invoke-virtual {p1}, Lcom/android/volley/Request;->getHeaders()Ljava/util/Map;

    move-result-object v3

    .line 406
    .local v3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    .local v4, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 407
    .local v2, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    const-string v7, "SDK_CloudRequestManager"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "Header KEY: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v8, "; VALUE: "

    invoke-virtual {v6, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v8, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lcom/android/volley/AuthFailureError; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 418
    .end local v2    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v3    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v4    # "i$":Ljava/util/Iterator;
    :catch_0
    move-exception v1

    .line 419
    .local v1, "e":Lcom/android/volley/AuthFailureError;
    const-string v6, "SDK_CloudRequestManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "AuthFailureError while getting headers for cloud reqeust: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, " : "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 422
    .end local v1    # "e":Lcom/android/volley/AuthFailureError;
    .end local v5    # "requestClassStr":Ljava/lang/String;
    :cond_0
    :goto_1
    return-void

    .line 411
    .restart local v3    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .restart local v4    # "i$":Ljava/util/Iterator;
    .restart local v5    # "requestClassStr":Ljava/lang/String;
    :cond_1
    :try_start_1
    invoke-virtual {p1}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v6

    if-eqz v6, :cond_2

    new-instance v0, Ljava/lang/String;

    invoke-virtual {p1}, Lcom/android/volley/Request;->getBody()[B

    move-result-object v6

    invoke-direct {v0, v6}, Ljava/lang/String;-><init>([B)V

    .line 413
    .local v0, "body":Ljava/lang/String;
    :goto_2
    const-string v6, "SDK_CloudRequestManager"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "REQUEST PROPERTIES. METHOD: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/android/volley/Request;->getMethod()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; TIMEOUT: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/android/volley/Request;->getRetryPolicy()Lcom/android/volley/RetryPolicy;

    move-result-object v8

    invoke-interface {v8}, Lcom/android/volley/RetryPolicy;->getCurrentTimeout()I

    move-result v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; URL: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {p1}, Lcom/android/volley/Request;->getUrl()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string v8, "; BODY: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v6, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 411
    .end local v0    # "body":Ljava/lang/String;
    :cond_2
    const-string v0, "null"
    :try_end_1
    .catch Lcom/android/volley/AuthFailureError; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method

.method private stopPeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 2
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 440
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->networkUtils:Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/utils/SDKNetworkUtils;->isHomeNetwork()Z

    move-result v0

    if-nez v0, :cond_0

    .line 441
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->instance()Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/CloudRequestTracker;->onRequestIssued()I

    move-result v0

    if-lez v0, :cond_0

    .line 442
    const-string v0, "SDK_CloudRequestManager"

    const-string v1, "STOPPING PERIODIC UPDATE"

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 443
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->getInstance(Landroid/content/Context;)Lcom/belkin/wemo/cache/devicelist/DeviceListManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/belkin/wemo/cache/devicelist/DeviceListManager;->stopCloudPeriodicUpdate()V

    .line 444
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->getRequestProcessor(Landroid/content/Context;)Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    move-result-object v0

    const-class v1, Lcom/belkin/wemo/cache/cloud/CloudRequestUpdateDeviceList;

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;->cancelAll(Ljava/lang/Object;)V

    .line 447
    :cond_0
    return-void
.end method


# virtual methods
.method public makeByteStreamRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 18
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 182
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v13

    .line 183
    .local v13, "requestClassStr":Ljava/lang/String;
    const-string v5, "SDK_CloudRequestManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Processing Byte Stream Cloud Request: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v5, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 187
    :try_start_0
    new-instance v9, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-direct {v9, v5}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 188
    .local v9, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    invoke-virtual {v9}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->generateAuthCode()Ljava/lang/String;

    move-result-object v6

    .line 189
    .local v6, "authHeader":Ljava/lang/String;
    const-string v5, "SDK_CloudRequestManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Authorization Header: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v5, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    invoke-interface/range {p1 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getRequestMethod()I

    move-result v14

    .line 194
    .local v14, "requestType":I
    const/4 v2, 0x0

    .line 195
    .local v2, "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    new-instance v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v4, v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 196
    .local v4, "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;
    invoke-interface/range {p1 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getURL()Ljava/lang/String;

    move-result-object v3

    .line 197
    .local v3, "url":Ljava/lang/String;
    invoke-interface/range {p1 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getFileByteArray()[B

    move-result-object v7

    .line 199
    .local v7, "body":[B
    packed-switch v14, :pswitch_data_0

    .line 211
    :goto_0
    if-eqz v2, :cond_1

    .line 213
    new-instance v5, Lcom/android/volley/DefaultRetryPolicy;

    const v15, 0xea60

    const/16 v16, 0x1

    const/16 v17, 0x0

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-direct {v5, v15, v0, v1}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v2, v5}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 216
    invoke-interface/range {p1 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getAdditionalHeaders()Ljava/util/Map;

    move-result-object v8

    .line 217
    .local v8, "additionalHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    if-eqz v8, :cond_0

    .line 218
    invoke-interface {v8}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v12

    .local v12, "i$":Ljava/util/Iterator;
    :goto_1
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/util/Map$Entry;

    .line 219
    .local v11, "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-interface {v11}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-interface {v11}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    invoke-virtual {v2, v5, v15}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 234
    .end local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    .end local v3    # "url":Ljava/lang/String;
    .end local v4    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;
    .end local v6    # "authHeader":Ljava/lang/String;
    .end local v7    # "body":[B
    .end local v8    # "additionalHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v9    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    .end local v11    # "entry":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/String;>;"
    .end local v12    # "i$":Ljava/util/Iterator;
    .end local v14    # "requestType":I
    :catch_0
    move-exception v10

    .line 235
    .local v10, "e":Lorg/json/JSONException;
    const-string v5, "SDK_CloudRequestManager"

    const-string v15, "JSONException while fetching AuthCode: "

    invoke-static {v5, v15, v10}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 236
    const/4 v5, 0x0

    const/16 v15, -0xc8

    const/16 v16, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-interface {v0, v5, v15, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    .line 238
    .end local v10    # "e":Lorg/json/JSONException;
    :goto_2
    return-void

    .line 201
    .restart local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    .restart local v3    # "url":Ljava/lang/String;
    .restart local v4    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;
    .restart local v6    # "authHeader":Ljava/lang/String;
    .restart local v7    # "body":[B
    .restart local v9    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    .restart local v14    # "requestType":I
    :pswitch_0
    :try_start_1
    new-instance v2, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;

    .end local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    invoke-direct {v2, v3, v4, v4, v6}, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;Ljava/lang/String;)V

    .line 202
    .restart local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    goto :goto_0

    .line 204
    :pswitch_1
    new-instance v2, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;

    .end local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    move-object v5, v4

    invoke-direct/range {v2 .. v7}, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;-><init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;Ljava/lang/String;[B)V

    .line 205
    .restart local v2    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<[B>;"
    goto :goto_0

    .line 223
    .restart local v8    # "additionalHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_0
    move-object/from16 v0, p0

    invoke-direct {v0, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->logCloudRequest(Lcom/android/volley/Request;)V

    .line 225
    invoke-direct/range {p0 .. p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->stopPeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 226
    invoke-virtual {v2, v13}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 227
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v5}, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->getRequestProcessor(Landroid/content/Context;)Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    move-result-object v5

    invoke-interface {v5, v2}, Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;->add(Lcom/android/volley/Request;)V

    goto :goto_2

    .line 230
    .end local v8    # "additionalHeadersMap":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    :cond_1
    const-string v5, "SDK_CloudRequestManager"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string v16, "Volley REQUEST IS NULL for CloudRequest: "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v5, v15}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    const/4 v5, 0x0

    const/16 v15, -0xc9

    const/16 v16, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, v16

    invoke-interface {v0, v5, v15, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 199
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;)V
    .locals 14
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v13, 0x0

    const/4 v12, 0x0

    .line 345
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v8

    .line 346
    .local v8, "requestClassStr":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Processing Cloud Request: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 350
    :try_start_0
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-direct {v6, v3}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 351
    .local v6, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->generateAuthCode()Ljava/lang/String;

    move-result-object v4

    .line 352
    .local v4, "authHeader":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "Authorization Header: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 354
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->isAuthHeaderRequired()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 355
    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->isRequestAuthorized(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 356
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->handleUnauthorizedRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 397
    .end local v4    # "authHeader":Ljava/lang/String;
    .end local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :goto_0
    return-void

    .line 361
    .restart local v4    # "authHeader":Ljava/lang/String;
    .restart local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :cond_0
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-direct {v2, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 362
    .local v2, "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->getURL()Ljava/lang/String;

    move-result-object v1

    .line 363
    .local v1, "url":Ljava/lang/String;
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->getFileByteArray()[B

    move-result-object v5

    .line 365
    .local v5, "body":[B
    if-eqz v5, :cond_4

    .line 367
    invoke-virtual {p1}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->getContentType()Ljava/lang/String;

    move-result-object v3

    const-string v9, "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"

    invoke-virtual {v3, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 368
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/MultipartFormDataPOSTRequest;

    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/request/MultipartFormDataPOSTRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;[B)V

    .line 373
    .local v0, "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;
    :goto_1
    const-string v3, "SDK_CloudRequestManager"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "IsForcedRemoteEnabled: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    sget-boolean v10, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 374
    sget-boolean v3, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    if-eqz v3, :cond_1

    .line 375
    const-string v3, "Log-Data"

    const-string v9, "ForcedRemote-1"

    invoke-virtual {v0, v3, v9}, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 379
    :cond_1
    if-eqz v0, :cond_2

    .line 380
    new-instance v3, Lcom/android/volley/DefaultRetryPolicy;

    const v9, 0xea60

    const/4 v10, 0x1

    const/4 v11, 0x0

    invoke-direct {v3, v9, v10, v11}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 383
    :cond_2
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->logCloudRequest(Lcom/android/volley/Request;)V

    .line 385
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->stopPeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 387
    invoke-virtual {v0, v8}, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 388
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->getRequestProcessor(Landroid/content/Context;)Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;->add(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 393
    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    .end local v4    # "authHeader":Ljava/lang/String;
    .end local v5    # "body":[B
    .end local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :catch_0
    move-exception v7

    .line 394
    .local v7, "e":Lorg/json/JSONException;
    const-string v3, "SDK_CloudRequestManager"

    const-string v9, "JSONException while fetching AuthCode: "

    invoke-static {v3, v9, v7}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 395
    const/16 v3, -0xc8

    invoke-virtual {p1, v12, v3, v13}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->requestComplete(ZI[B)V

    goto :goto_0

    .line 370
    .end local v7    # "e":Lorg/json/JSONException;
    .restart local v1    # "url":Ljava/lang/String;
    .restart local v2    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    .restart local v4    # "authHeader":Ljava/lang/String;
    .restart local v5    # "body":[B
    .restart local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :cond_3
    :try_start_1
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;

    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;[B)V

    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;
    goto :goto_1

    .line 390
    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;
    :cond_4
    const-string v3, "SDK_CloudRequestManager"

    const-string v9, "getFileByteArray returned null"

    invoke-static {v3, v9}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    const/4 v3, 0x0

    const/16 v9, -0x12c

    const/4 v10, 0x0

    invoke-virtual {p1, v3, v9, v10}, Lcom/belkin/wemo/cache/cloud/AbstractMultipartCloudRequest;->requestComplete(ZI[B)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method

.method public makeMultiPartRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;)[Ljava/lang/String;
    .locals 12
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .prologue
    const/4 v11, 0x1

    .line 450
    const-string v7, "SDK_CloudRequestManager"

    const-string v8, "In makeMultiPartRequest"

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 451
    new-instance v6, Ljava/net/URL;

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getURL()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 452
    .local v6, "url":Ljava/net/URL;
    invoke-virtual {v6}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v7

    check-cast v7, Ljava/net/HttpURLConnection;

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    .line 453
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    const/4 v8, 0x0

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 454
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getRequestMethod()Z

    move-result v8

    invoke-virtual {v7, v8}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 455
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v7, v11}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 456
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    const-string v8, "Content-Type"

    const-string v9, "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"

    invoke-virtual {v7, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 457
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    const-string v8, "User-Agent"

    const-string v9, "WeMo_Android"

    invoke-virtual {v7, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 458
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->outputStream:Ljava/io/OutputStream;

    .line 459
    new-instance v7, Ljava/io/PrintWriter;

    new-instance v8, Ljava/io/OutputStreamWriter;

    iget-object v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->outputStream:Ljava/io/OutputStream;

    const-string v10, "UTF-8"

    invoke-direct {v8, v9, v10}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v7, v8, v11}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    iput-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    .line 461
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "User-Agent: WeMo_Android"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 462
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    invoke-virtual {v7}, Ljava/io/PrintWriter;->flush()V

    .line 464
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getFormKeys()[Ljava/lang/String;

    move-result-object v7

    array-length v7, v7

    if-ge v0, v7, :cond_0

    .line 465
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "--MULTIPART-FORM-DATA-BOUNDARY"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 466
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "Content-Disposition: form-data; name=\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getFormKeys()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v0

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, "\""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 467
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "Content-Type: text/plain; charset=UTF-8"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 468
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 469
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getFormValues()[Ljava/lang/String;

    move-result-object v8

    aget-object v8, v8, v0

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 470
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    invoke-virtual {v7}, Ljava/io/PrintWriter;->flush()V

    .line 471
    const-string v7, "SDK_CloudRequestManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "FormField: getFormKeys: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getFormKeys()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v0

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " getFormValues: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->getFormValues()[Ljava/lang/String;

    move-result-object v9

    aget-object v9, v9, v0

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 464
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    .line 474
    :cond_0
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    invoke-virtual {v7}, Ljava/io/PrintWriter;->flush()V

    .line 475
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    const-string v8, "MULTIPART-FORM-DATA-BOUNDARY--"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v7

    const-string v8, "\r\n"

    invoke-virtual {v7, v8}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 476
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->writer:Ljava/io/PrintWriter;

    invoke-virtual {v7}, Ljava/io/PrintWriter;->close()V

    .line 477
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v7

    iput v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->status:I

    .line 478
    iget v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->status:I

    const/16 v8, 0xc8

    if-ne v7, v8, :cond_2

    .line 479
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v7, Ljava/io/InputStreamReader;

    iget-object v8, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v8}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v7}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 480
    .local v3, "reader":Ljava/io/BufferedReader;
    const/4 v2, 0x0

    .line 481
    .local v2, "line":Ljava/lang/String;
    :goto_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_1

    .line 482
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->response:Ljava/util/List;

    invoke-interface {v7, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 484
    :cond_1
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    .line 485
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->httpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v7}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 487
    .end local v2    # "line":Ljava/lang/String;
    .end local v3    # "reader":Ljava/io/BufferedReader;
    :cond_2
    const-string v4, ""

    .line 488
    .local v4, "respStr":Ljava/lang/String;
    iget-object v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->response:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .local v1, "i$":Ljava/util/Iterator;
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 490
    .local v5, "s":Ljava/lang/String;
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 491
    goto :goto_2

    .line 492
    .end local v5    # "s":Ljava/lang/String;
    :cond_3
    const-string v7, "SDK_CloudRequestManager"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "status: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    iget v9, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->status:I

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v9, " response: "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v7, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 493
    iget v7, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->status:I

    invoke-interface {p1, v7, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterfaceForMultipart;->requestComplete(ILjava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    return-object v7
.end method

.method public makeRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 14
    .param p1, "request"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 252
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v9

    .line 253
    .local v9, "requestClassStr":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Processing Cloud Request: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 257
    :try_start_0
    new-instance v6, Lcom/belkin/wemo/cache/cloud/CloudAuth;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-direct {v6, v3}, Lcom/belkin/wemo/cache/cloud/CloudAuth;-><init>(Landroid/content/Context;)V

    .line 258
    .local v6, "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    invoke-virtual {v6}, Lcom/belkin/wemo/cache/cloud/CloudAuth;->generateAuthCode()Ljava/lang/String;

    move-result-object v4

    .line 259
    .local v4, "authHeader":Ljava/lang/String;
    const-string v3, "SDK_CloudRequestManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "Authorization Header: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 267
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->isAuthHeaderRequired()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 268
    invoke-direct {p0, v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->isRequestAuthorized(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 269
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->handleUnauthorizedRequest(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 342
    .end local v4    # "authHeader":Ljava/lang/String;
    .end local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :goto_0
    return-void

    .line 274
    .restart local v4    # "authHeader":Ljava/lang/String;
    .restart local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    :cond_0
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getRequestMethod()I

    move-result v10

    .line 276
    .local v10, "requestType":I
    const/4 v0, 0x0

    .line 277
    .local v0, "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    new-instance v2, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-direct {v2, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 278
    .local v2, "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getURL()Ljava/lang/String;

    move-result-object v1

    .line 279
    .local v1, "url":Ljava/lang/String;
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getBody()Ljava/lang/String;

    move-result-object v5

    .line 281
    .local v5, "body":Ljava/lang/String;
    packed-switch v10, :pswitch_data_0

    .line 316
    :cond_1
    :goto_1
    const-string v3, "SDK_CloudRequestManager"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "IsForcedRemoteEnabled: "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    sget-boolean v12, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v3, v11}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    sget-boolean v3, Lcom/belkin/wemo/cache/cloud/SmartDiscovery;->isForcedRemoteEnabled:Z

    if-eqz v3, :cond_2

    .line 319
    const-string v3, "Log-Data"

    const-string v11, "ForcedRemote-1"

    invoke-virtual {v0, v3, v11}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 323
    :cond_2
    if-eqz v0, :cond_3

    .line 324
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-class v11, Lcom/belkin/wemo/cache/cloud/HTTPRequestUnicastDiscovery;

    invoke-virtual {v3, v11}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 325
    new-instance v3, Lcom/android/volley/DefaultRetryPolicy;

    const/16 v11, 0x1388

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-direct {v3, v11, v12, v13}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;

    .line 332
    :cond_3
    :goto_2
    invoke-direct {p0, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->logCloudRequest(Lcom/android/volley/Request;)V

    .line 334
    invoke-direct {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->stopPeriodicUpdateIfRequired(Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 336
    invoke-virtual {v0, v9}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->setTag(Ljava/lang/Object;)Lcom/android/volley/Request;

    .line 337
    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->context:Landroid/content/Context;

    invoke-static {v3}, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/RequestProcessorFactory;->getRequestProcessor(Landroid/content/Context;)Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;

    move-result-object v3

    invoke-interface {v3, v0}, Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;->add(Lcom/android/volley/Request;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 338
    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    .end local v1    # "url":Ljava/lang/String;
    .end local v2    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    .end local v4    # "authHeader":Ljava/lang/String;
    .end local v5    # "body":Ljava/lang/String;
    .end local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    .end local v10    # "requestType":I
    :catch_0
    move-exception v8

    .line 339
    .local v8, "e":Lorg/json/JSONException;
    const-string v3, "SDK_CloudRequestManager"

    const-string v11, "JSONException while fetching AuthCode: "

    invoke-static {v3, v11, v8}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 340
    const/4 v3, 0x0

    const/16 v11, -0xc8

    const/4 v12, 0x0

    invoke-interface {p1, v3, v11, v12}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    goto :goto_0

    .line 283
    .end local v8    # "e":Lorg/json/JSONException;
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    .restart local v1    # "url":Ljava/lang/String;
    .restart local v2    # "listener":Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
    .restart local v4    # "authHeader":Ljava/lang/String;
    .restart local v5    # "body":Ljava/lang/String;
    .restart local v6    # "cloudAuth":Lcom/belkin/wemo/cache/cloud/CloudAuth;
    .restart local v10    # "requestType":I
    :pswitch_0
    :try_start_1
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/XMLGetRequest;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    invoke-direct {v0, v1, v2, v2, v4}, Lcom/belkin/wemo/cache/cloud/request/XMLGetRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .line 284
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    goto :goto_1

    .line 287
    :pswitch_1
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->getFileByteArray()[B

    move-result-object v7

    .line 288
    .local v7, "data":[B
    if-nez v7, :cond_1

    .line 291
    const-string v3, "/apis/http/firmware/upgrades"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 292
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/JSONPostRequest;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    invoke-direct {v0, v1, v2, v2, v4}, Lcom/belkin/wemo/cache/cloud/request/JSONPostRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .line 293
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    const-string v3, "App-Version"

    const-string v11, "Android.Latest"

    invoke-virtual {v0, v3, v11}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 294
    invoke-interface {p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->isAuthHeaderRequired()Z

    move-result v3

    if-nez v3, :cond_4

    .line 296
    const-string v3, "Authorization"

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->removeHeader(Ljava/lang/String;)Ljava/lang/String;

    .line 301
    :cond_4
    :goto_3
    invoke-virtual {v0, v5}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->setStringBody(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 299
    :cond_5
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/XMLPostRequest;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    invoke-direct {v0, v1, v2, v2, v4}, Lcom/belkin/wemo/cache/cloud/request/XMLPostRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    goto :goto_3

    .line 306
    .end local v7    # "data":[B
    :pswitch_2
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/XMLPostRequest;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    invoke-direct {v0, v1, v2, v2, v4}, Lcom/belkin/wemo/cache/cloud/request/XMLPostRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .line 307
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    goto/16 :goto_1

    .line 310
    :pswitch_3
    new-instance v0, Lcom/belkin/wemo/cache/cloud/request/XMLPutRequest;

    .end local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    move-object v3, v2

    invoke-direct/range {v0 .. v5}, Lcom/belkin/wemo/cache/cloud/request/XMLPutRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 311
    .restart local v0    # "cloudRequest":Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
    goto/16 :goto_1

    .line 327
    :cond_6
    new-instance v3, Lcom/android/volley/DefaultRetryPolicy;

    const v11, 0xea60

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-direct {v3, v11, v12, v13}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    invoke-virtual {v0, v3}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->setRetryPolicy(Lcom/android/volley/RetryPolicy;)Lcom/android/volley/Request;
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    .line 281
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method
