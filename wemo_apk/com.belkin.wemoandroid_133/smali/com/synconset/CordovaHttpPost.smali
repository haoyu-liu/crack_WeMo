.class public Lcom/synconset/CordovaHttpPost;
.super Lcom/synconset/CordovaHttp;
.source "CordovaHttpPost.java"

# interfaces
.implements Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;)V
    .locals 0
    .param p1, "urlString"    # Ljava/lang/String;
    .param p4, "callbackContext"    # Lorg/apache/cordova/CallbackContext;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<**>;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lorg/apache/cordova/CallbackContext;",
            ")V"
        }
    .end annotation

    .prologue
    .line 18
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/synconset/CordovaHttp;-><init>(Ljava/lang/String;Ljava/util/Map;Ljava/util/Map;Lorg/apache/cordova/CallbackContext;)V

    .line 19
    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 24
    :try_start_0
    invoke-virtual {p0}, Lcom/synconset/CordovaHttpPost;->getUrlString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/synconset/HttpRequest;->post(Ljava/lang/CharSequence;)Lcom/synconset/HttpRequest;

    move-result-object v3

    .line 25
    .local v3, "request":Lcom/synconset/HttpRequest;
    invoke-virtual {p0, v3}, Lcom/synconset/CordovaHttpPost;->setupSecurity(Lcom/synconset/HttpRequest;)Lcom/synconset/HttpRequest;

    .line 26
    const-string v5, "UTF-8"

    invoke-virtual {v3, v5}, Lcom/synconset/HttpRequest;->acceptCharset(Ljava/lang/String;)Lcom/synconset/HttpRequest;

    .line 27
    invoke-virtual {p0}, Lcom/synconset/CordovaHttpPost;->getHeaders()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/synconset/HttpRequest;->headers(Ljava/util/Map;)Lcom/synconset/HttpRequest;

    .line 28
    invoke-virtual {p0}, Lcom/synconset/CordovaHttpPost;->getParams()Ljava/util/Map;

    move-result-object v5

    invoke-virtual {v3, v5}, Lcom/synconset/HttpRequest;->form(Ljava/util/Map;)Lcom/synconset/HttpRequest;

    .line 29
    invoke-virtual {v3}, Lcom/synconset/HttpRequest;->code()I

    move-result v1

    .line 30
    .local v1, "code":I
    const-string v5, "UTF-8"

    invoke-virtual {v3, v5}, Lcom/synconset/HttpRequest;->body(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 31
    .local v0, "body":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 32
    .local v4, "response":Lorg/json/JSONObject;
    const-string v5, "status"

    invoke-virtual {v4, v5, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 33
    const/16 v5, 0xc8

    if-lt v1, v5, :cond_0

    const/16 v5, 0x12c

    if-ge v1, v5, :cond_0

    .line 34
    const-string v5, "data"

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 35
    invoke-virtual {p0}, Lcom/synconset/CordovaHttpPost;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/apache/cordova/CallbackContext;->success(Lorg/json/JSONObject;)V

    .line 49
    .end local v0    # "body":Ljava/lang/String;
    .end local v1    # "code":I
    .end local v3    # "request":Lcom/synconset/HttpRequest;
    .end local v4    # "response":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 37
    .restart local v0    # "body":Ljava/lang/String;
    .restart local v1    # "code":I
    .restart local v3    # "request":Lcom/synconset/HttpRequest;
    .restart local v4    # "response":Lorg/json/JSONObject;
    :cond_0
    const-string v5, "error"

    invoke-virtual {v4, v5, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 38
    invoke-virtual {p0}, Lcom/synconset/CordovaHttpPost;->getCallbackContext()Lorg/apache/cordova/CallbackContext;

    move-result-object v5

    invoke-virtual {v5, v4}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/synconset/HttpRequest$HttpRequestException; {:try_start_0 .. :try_end_0} :catch_1

    goto :goto_0

    .line 40
    .end local v0    # "body":Ljava/lang/String;
    .end local v1    # "code":I
    .end local v3    # "request":Lcom/synconset/HttpRequest;
    .end local v4    # "response":Lorg/json/JSONObject;
    :catch_0
    move-exception v2

    .line 41
    .local v2, "e":Lorg/json/JSONException;
    const-string v5, "There was an error generating the response"

    invoke-virtual {p0, v5}, Lcom/synconset/CordovaHttpPost;->respondWithError(Ljava/lang/String;)V

    goto :goto_0

    .line 42
    .end local v2    # "e":Lorg/json/JSONException;
    :catch_1
    move-exception v2

    .line 43
    .local v2, "e":Lcom/synconset/HttpRequest$HttpRequestException;
    invoke-virtual {v2}, Lcom/synconset/HttpRequest$HttpRequestException;->getCause()Ljava/io/IOException;

    move-result-object v5

    instance-of v5, v5, Ljava/net/UnknownHostException;

    if-eqz v5, :cond_1

    .line 44
    const/4 v5, 0x0

    const-string v6, "The host could not be resolved"

    invoke-virtual {p0, v5, v6}, Lcom/synconset/CordovaHttpPost;->respondWithError(ILjava/lang/String;)V

    goto :goto_0

    .line 46
    :cond_1
    const-string v5, "There was an error with the request"

    invoke-virtual {p0, v5}, Lcom/synconset/CordovaHttpPost;->respondWithError(Ljava/lang/String;)V

    goto :goto_0
.end method
