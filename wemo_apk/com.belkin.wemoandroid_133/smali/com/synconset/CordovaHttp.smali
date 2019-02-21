.class public abstract Lcom/synconset/CordovaHttp;
.super Ljava/lang/Object;
.source "CordovaHttp.java"


# static fields
.field protected static final CHARSET:Ljava/lang/String; = "UTF-8"

.field protected static final TAG:Ljava/lang/String; = "CordovaHTTP"

.field private static acceptAllCerts:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private static sslPinning:Ljava/util/concurrent/atomic/AtomicBoolean;


# instance fields
.field private callbackContext:Lorg/apache/cordova/CallbackContext;

.field private headers:Ljava/util/Map;
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

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<**>;"
        }
    .end annotation
.end field

.field private urlString:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 20
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/synconset/CordovaHttp;->sslPinning:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 21
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    sput-object v0, Lcom/synconset/CordovaHttp;->acceptAllCerts:Ljava/util/concurrent/atomic/AtomicBoolean;

    return-void
.end method

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
    .line 28
    .local p2, "params":Ljava/util/Map;, "Ljava/util/Map<**>;"
    .local p3, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    iput-object p1, p0, Lcom/synconset/CordovaHttp;->urlString:Ljava/lang/String;

    .line 30
    iput-object p2, p0, Lcom/synconset/CordovaHttp;->params:Ljava/util/Map;

    .line 31
    iput-object p3, p0, Lcom/synconset/CordovaHttp;->headers:Ljava/util/Map;

    .line 32
    iput-object p4, p0, Lcom/synconset/CordovaHttp;->callbackContext:Lorg/apache/cordova/CallbackContext;

    .line 33
    return-void
.end method

.method public static acceptAllCerts(Z)V
    .locals 2
    .param p0, "accept"    # Z

    .prologue
    .line 43
    sget-object v0, Lcom/synconset/CordovaHttp;->acceptAllCerts:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 44
    if-eqz p0, :cond_0

    .line 45
    sget-object v0, Lcom/synconset/CordovaHttp;->sslPinning:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 47
    :cond_0
    return-void
.end method

.method public static enableSSLPinning(Z)V
    .locals 2
    .param p0, "enable"    # Z

    .prologue
    .line 36
    sget-object v0, Lcom/synconset/CordovaHttp;->sslPinning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 37
    if-eqz p0, :cond_0

    .line 38
    sget-object v0, Lcom/synconset/CordovaHttp;->acceptAllCerts:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 40
    :cond_0
    return-void
.end method


# virtual methods
.method protected getCallbackContext()Lorg/apache/cordova/CallbackContext;
    .locals 1

    .prologue
    .line 62
    iget-object v0, p0, Lcom/synconset/CordovaHttp;->callbackContext:Lorg/apache/cordova/CallbackContext;

    return-object v0
.end method

.method protected getHeaders()Ljava/util/Map;
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

    .prologue
    .line 58
    iget-object v0, p0, Lcom/synconset/CordovaHttp;->headers:Ljava/util/Map;

    return-object v0
.end method

.method protected getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map",
            "<**>;"
        }
    .end annotation

    .prologue
    .line 54
    iget-object v0, p0, Lcom/synconset/CordovaHttp;->params:Ljava/util/Map;

    return-object v0
.end method

.method protected getUrlString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 50
    iget-object v0, p0, Lcom/synconset/CordovaHttp;->urlString:Ljava/lang/String;

    return-object v0
.end method

.method protected respondWithError(ILjava/lang/String;)V
    .locals 3
    .param p1, "status"    # I
    .param p2, "msg"    # Ljava/lang/String;

    .prologue
    .line 78
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 79
    .local v1, "response":Lorg/json/JSONObject;
    const-string v2, "status"

    invoke-virtual {v1, v2, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 80
    const-string v2, "error"

    invoke-virtual {v1, v2, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 81
    iget-object v2, p0, Lcom/synconset/CordovaHttp;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, v1}, Lorg/apache/cordova/CallbackContext;->error(Lorg/json/JSONObject;)V
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    .end local v1    # "response":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 82
    :catch_0
    move-exception v0

    .line 83
    .local v0, "e":Lorg/json/JSONException;
    iget-object v2, p0, Lcom/synconset/CordovaHttp;->callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v2, p2}, Lorg/apache/cordova/CallbackContext;->error(Ljava/lang/String;)V

    goto :goto_0
.end method

.method protected respondWithError(Ljava/lang/String;)V
    .locals 1
    .param p1, "msg"    # Ljava/lang/String;

    .prologue
    .line 88
    const/16 v0, 0x1f4

    invoke-virtual {p0, v0, p1}, Lcom/synconset/CordovaHttp;->respondWithError(ILjava/lang/String;)V

    .line 89
    return-void
.end method

.method protected setupSecurity(Lcom/synconset/HttpRequest;)Lcom/synconset/HttpRequest;
    .locals 1
    .param p1, "request"    # Lcom/synconset/HttpRequest;

    .prologue
    .line 66
    sget-object v0, Lcom/synconset/CordovaHttp;->acceptAllCerts:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p1}, Lcom/synconset/HttpRequest;->trustAllCerts()Lcom/synconset/HttpRequest;

    .line 68
    invoke-virtual {p1}, Lcom/synconset/HttpRequest;->trustAllHosts()Lcom/synconset/HttpRequest;

    .line 70
    :cond_0
    sget-object v0, Lcom/synconset/CordovaHttp;->sslPinning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 71
    invoke-virtual {p1}, Lcom/synconset/HttpRequest;->pinToCerts()Lcom/synconset/HttpRequest;

    .line 73
    :cond_1
    return-object p1
.end method
