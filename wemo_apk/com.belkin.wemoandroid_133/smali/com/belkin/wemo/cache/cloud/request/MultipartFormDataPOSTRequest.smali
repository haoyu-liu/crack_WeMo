.class public Lcom/belkin/wemo/cache/cloud/request/MultipartFormDataPOSTRequest;
.super Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;
.source "MultipartFormDataPOSTRequest.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;[B)V
    .locals 0
    .param p1, "url"    # Ljava/lang/String;
    .param p3, "errorListener"    # Lcom/android/volley/Response$ErrorListener;
    .param p4, "authHeader"    # Ljava/lang/String;
    .param p5, "body"    # [B
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    .line 9
    .local p2, "listener":Lcom/android/volley/Response$Listener;, "Lcom/android/volley/Response$Listener<Ljava/lang/String;>;"
    invoke-direct/range {p0 .. p5}, Lcom/belkin/wemo/cache/cloud/request/MultipartPOSTRequest;-><init>(Ljava/lang/String;Lcom/android/volley/Response$Listener;Lcom/android/volley/Response$ErrorListener;Ljava/lang/String;[B)V

    .line 10
    return-void
.end method


# virtual methods
.method public getBodyContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 14
    const-string v0, "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"

    return-object v0
.end method

.method protected getHeaderContentType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 19
    const-string v0, "multipart/form-data; boundary=MULTIPART-FORM-DATA-BOUNDARY"

    return-object v0
.end method
