.class public abstract Lcom/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest;
.super Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
.source "AbstractMultiPartRequest.java"


# instance fields
.field private final CONTENT_TYPE_MULTIPART:Ljava/lang/String;

.field private fileBody:[B


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;[B)V
    .locals 1
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "authHeader"    # Ljava/lang/String;
    .param p6, "body"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            "Lcom/android/volley/Response$Listener",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/android/volley/Response$ErrorListener;",
            "Ljava/lang/String;",
            "[B)V"
        }
    .end annotation

    .prologue
    .line 15
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p5}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .line 9
    const-string v0, "multipart/form-data"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest;->CONTENT_TYPE_MULTIPART:Ljava/lang/String;

    .line 16
    iput-object p6, p0, Lcom/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest;->fileBody:[B

    .line 17
    return-void
.end method


# virtual methods
.method public getBody()[B
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 31
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest;->fileBody:[B

    return-object v0
.end method

.method public getBodyContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 21
    const-string v0, "multipart/form-data"

    return-object v0
.end method

.method protected getHeaderContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    const-string v0, "multipart/form-data"

    return-object v0
.end method

.method public getStringBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 36
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/AbstractMultiPartRequest;->fileBody:[B

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
