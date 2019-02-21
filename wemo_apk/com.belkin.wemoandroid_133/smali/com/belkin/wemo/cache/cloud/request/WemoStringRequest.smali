.class public abstract Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
.super Lcom/android/volley/toolbox/StringRequest;
.source "WemoStringRequest.java"


# static fields
.field public static final AUTH:Ljava/lang/String; = "Authorization"

.field public static final CONTENT_TYPE:Ljava/lang/String; = "Content-Type"


# instance fields
.field private final DEFAULT_CHARSET_NAME:Ljava/lang/String;

.field protected final TAG:Ljava/lang/String;

.field private authHeader:Ljava/lang/String;

.field private body:Ljava/lang/String;

.field private charsetName:Ljava/lang/String;

.field private headersMap:Ljava/util/Map;
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


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V
    .locals 7
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "authHeader"    # Ljava/lang/String;
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
            ")V"
        }
    .end annotation

    .prologue
    .line 29
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Ljava/lang/String;>;"
    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    invoke-direct/range {v0 .. v6}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    return-void
.end method

.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p1, "method"    # I
    .param p2, "url"    # Ljava/lang/String;
    .param p4, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p5, "authHeader"    # Ljava/lang/String;
    .param p6, "body"    # Ljava/lang/String;
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
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 34
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/android/volley/toolbox/StringRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;)V

    .line 21
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->DEFAULT_CHARSET_NAME:Ljava/lang/String;

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->TAG:Ljava/lang/String;

    .line 38
    invoke-virtual {p0, p6}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->setStringBody(Ljava/lang/String;)V

    .line 39
    const-string v0, "UTF-8"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->charsetName:Ljava/lang/String;

    .line 40
    iput-object p5, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->authHeader:Ljava/lang/String;

    .line 41
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    .line 42
    invoke-direct {p0}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->addDefaultHeaders()V

    .line 43
    return-void
.end method

.method private addDefaultHeaders()V
    .locals 3

    .prologue
    .line 46
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Content-Type"

    invoke-virtual {p0}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->getHeaderContentType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    const-string v1, "Authorization"

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->authHeader:Ljava/lang/String;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "value"    # Ljava/lang/String;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getBody()[B
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/android/volley/AuthFailureError;
        }
    .end annotation

    .prologue
    .line 74
    const/4 v0, 0x0

    .line 76
    .local v0, "bytes":[B
    :try_start_0
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->body:Ljava/lang/String;

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->charsetName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 80
    :goto_0
    return-object v0

    .line 77
    :catch_0
    move-exception v1

    .line 78
    .local v1, "e":Ljava/io/UnsupportedEncodingException;
    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "UnsupportedEncodingException for charsetName: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->charsetName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    goto :goto_0
.end method

.method public abstract getBodyContentType()Ljava/lang/String;
.end method

.method public getCharsetName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 95
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->charsetName:Ljava/lang/String;

    return-object v0
.end method

.method protected abstract getHeaderContentType()Ljava/lang/String;
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
    .line 69
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    return-object v0
.end method

.method public getStringBody()Ljava/lang/String;
    .locals 1

    .prologue
    .line 91
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->body:Ljava/lang/String;

    return-object v0
.end method

.method public removeHeader(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    .line 107
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->headersMap:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public setCharsetName(Ljava/lang/String;)V
    .locals 0
    .param p1, "charsetName"    # Ljava/lang/String;

    .prologue
    .line 99
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->charsetName:Ljava/lang/String;

    .line 100
    return-void
.end method

.method public setStringBody(Ljava/lang/String;)V
    .locals 0
    .param p1, "body"    # Ljava/lang/String;

    .prologue
    .line 84
    if-nez p1, :cond_0

    .line 85
    const-string p1, ""

    .line 87
    :cond_0
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;->body:Ljava/lang/String;

    .line 88
    return-void
.end method
