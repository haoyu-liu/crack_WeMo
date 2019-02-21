.class public Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;
.super Lcom/belkin/wemo/cache/cloud/request/WemoRequest;
.source "ByteStreamGetRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/cache/cloud/request/WemoRequest",
        "<[B>;"
    }
.end annotation


# instance fields
.field private authHeader:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;Ljava/lang/String;)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "errorlistener"    # Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;
    .param p4, "authHeader"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener",
            "<[B>;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 19
    .local p3, "successlistener":Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;, "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener<[B>;"
    const/4 v0, 0x0

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;-><init>(ILjava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;)V

    .line 21
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->authHeader:Ljava/lang/String;

    .line 22
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->addDefaultHeaders()V

    .line 23
    return-void
.end method

.method private addDefaultHeaders()V
    .locals 3

    .prologue
    .line 26
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Content-Type"

    const-string v2, "application/xml"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 27
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Authorization"

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->authHeader:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 28
    return-void
.end method


# virtual methods
.method protected extractNetworkResponse(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Response;
    .locals 2
    .param p1, "response"    # Lcom/android/volley/NetworkResponse;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/volley/NetworkResponse;",
            ")",
            "Lcom/android/volley/Response",
            "<[B>;"
        }
    .end annotation

    .prologue
    .line 32
    iget-object v0, p1, Lcom/android/volley/NetworkResponse;->data:[B

    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;

    move-result-object v0

    return-object v0
.end method

.method public getHeaders()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 37
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamGetRequest;->headersMap:Ljava/util/Map;

    return-object v0
.end method
