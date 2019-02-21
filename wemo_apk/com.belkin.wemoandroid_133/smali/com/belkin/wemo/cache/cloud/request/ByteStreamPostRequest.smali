.class public Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;
.super Lcom/belkin/wemo/cache/cloud/request/WemoRequest;
.source "ByteStreamPostRequest.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/belkin/wemo/cache/cloud/request/WemoRequest",
        "<[B>;"
    }
.end annotation


# instance fields
.field private authHeader:Ljava/lang/String;

.field private body:[B


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;Ljava/lang/String;[B)V
    .locals 1
    .param p1, "url"    # Ljava/lang/String;
    .param p2, "errorlistener"    # Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;
    .param p4, "authHeader"    # Ljava/lang/String;
    .param p5, "body"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;",
            "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener",
            "<[B>;",
            "Ljava/lang/String;",
            "[B)V"
        }
    .end annotation

    .prologue
    .line 20
    .local p3, "successlistener":Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;, "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener<[B>;"
    const/4 v0, 0x1

    invoke-direct {p0, v0, p1, p2, p3}, Lcom/belkin/wemo/cache/cloud/request/WemoRequest;-><init>(ILjava/lang/String;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;)V

    .line 22
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->body:[B

    .line 23
    iput-object p4, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->authHeader:Ljava/lang/String;

    .line 24
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->addDefaultHeaders()V

    .line 25
    return-void
.end method

.method private addDefaultHeaders()V
    .locals 3

    .prologue
    .line 28
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Content-Type"

    const-string v2, "application/xml"

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Authorization"

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->authHeader:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
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
    .line 34
    iget-object v0, p1, Lcom/android/volley/NetworkResponse;->data:[B

    invoke-static {p1}, Lcom/android/volley/toolbox/HttpHeaderParser;->parseCacheHeaders(Lcom/android/volley/NetworkResponse;)Lcom/android/volley/Cache$Entry;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/android/volley/Response;->success(Ljava/lang/Object;Lcom/android/volley/Cache$Entry;)Lcom/android/volley/Response;

    move-result-object v0

    return-object v0
.end method

.method public getBody()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->body:[B

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
    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/ByteStreamPostRequest;->headersMap:Ljava/util/Map;

    return-object v0
.end method
