.class public abstract Lcom/belkin/wemo/cache/cloud/request/WemoRequest;
.super Lcom/android/volley/Request;
.source "WemoRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/android/volley/Request",
        "<TT;>;"
    }
.end annotation


# static fields
.field public static final AUTH:Ljava/lang/String; = "Authorization"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"


# instance fields
.field private final DEFAULT_TIMEOUT_MS:I

.field protected final TAG:Ljava/lang/String;

.field private backoffMultiplier:F

.field protected headersMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private initialTimeoutMs:I

.field private maxRetriesCount:I

.field private statusCode:I

.field private successListener:Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;)V
    .locals 1
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p3, "errorlistener"    # Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    .local p4, "successlistener":Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;, "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener<TT;>;"
    const v0, 0xea60

    .line 31
    invoke-direct {p0, p1, p2, p3}, Lcom/android/volley/Request;-><init>(ILjava/lang/String;Lcom/android/volley/Response$ErrorListener;)V

    .line 27
    iput v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->DEFAULT_TIMEOUT_MS:I

    .line 32
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->successListener:Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;

    .line 33
    iput v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->initialTimeoutMs:I

    .line 34
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->backoffMultiplier:F

    .line 35
    const/4 v0, 0x1

    iput v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->maxRetriesCount:I

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->TAG:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->headersMap:Ljava/util/Map;

    .line 38
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 90
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Adding header to WemoRequest. Key: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Value: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->headersMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    return-void
.end method

.method protected deliverResponse(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 53
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    .local p1, "response":Ljava/lang/Object;, "TT;"
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->successListener:Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->successListener:Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->statusCode:I

    invoke-interface {v0, p1, v1}, Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;->onResponse(Ljava/lang/Object;I)V

    .line 56
    :cond_0
    return-void
.end method

.method protected abstract extractNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<TT;>;"
        }
    .end annotation
.end method

.method public getBackoffMultiplier()F
    .locals 1

    .prologue
    .line 82
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->backoffMultiplier:F

    return v0
.end method

.method public getInitialTimeoutMs()I
    .locals 1

    .prologue
    .line 66
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->initialTimeoutMs:I

    return v0
.end method

.method public getMaxRetriesCount()I
    .locals 1

    .prologue
    .line 74
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iget v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->maxRetriesCount:I

    return v0
.end method

.method public getRetryPolicy()Lcom/android/volley/RetryPolicy;
    .locals 4

    .prologue
    .line 62
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    new-instance v0, Lcom/android/volley/DefaultRetryPolicy;

    iget v1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->initialTimeoutMs:I

    iget v2, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->maxRetriesCount:I

    iget v3, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->backoffMultiplier:F

    invoke-direct {v0, v1, v2, v3}, Lcom/android/volley/DefaultRetryPolicy;-><init>(IIF)V

    return-object v0
.end method

.method protected parseNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 2
    .param p1, "response"    # Lcom/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 42
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    const/4 v0, 0x0

    .line 43
    .local v0, "parsedResponse":Lcom/android/volley/Response;, "Lcom/android/volley/Response<TT;>;"
    if-eqz p1, :cond_0

    .line 44
    iget v1, p1, Lcom/android/volley/NetworkResponse;->statusCode:I

    iput v1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->statusCode:I

    .line 45
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->extractNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;

    move-result-object v0

    .line 47
    :cond_0
    return-object v0
.end method

.method public setBackoffMultiplier(F)V
    .locals 0
    .param p1, "backoffMultiplier"    # F

    .prologue
    .line 86
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iput p1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->backoffMultiplier:F

    .line 87
    return-void
.end method

.method public setInitialTimeoutMs(I)V
    .locals 0
    .param p1, "initialTimeoutMs"    # I

    .prologue
    .line 70
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iput p1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->initialTimeoutMs:I

    .line 71
    return-void
.end method

.method public setMaxRetriesCount(I)V
    .locals 0
    .param p1, "maxRetriesCount"    # I

    .prologue
    .line 78
    .local p0, "this":Lcom/belkin/wemo/cache/cloud/request/WemoRequest;, "Lcom/belkin/wemo/cache/cloud/request/WemoRequest<TT;>;"
    iput p1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;->maxRetriesCount:I

    .line 79
    return-void
.end method
