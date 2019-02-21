.class public abstract Lcom/belkin/wemo/cache/cloud/request/AbstractJSONStringRequest;
.super Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;
.source "AbstractJSONStringRequest.java"


# instance fields
.field private final APP_JSON:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V
    .locals 1
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
    .line 11
    .local p3, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p5}, Lcom/belkin/wemo/cache/cloud/request/WemoStringRequest;-><init>(ILjava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;)V

    .line 14
    const-string v0, "application/json"

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/request/AbstractJSONStringRequest;->APP_JSON:Ljava/lang/String;

    .line 12
    return-void
.end method


# virtual methods
.method public getBodyContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 29
    const-string v0, "application/json"

    return-object v0
.end method

.method protected getHeaderContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 24
    const-string v0, "application/json"

    return-object v0
.end method
