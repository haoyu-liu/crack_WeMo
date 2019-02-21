.class public Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;
.super Ljava/lang/Object;
.source "WemoRequestProcessor.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/requestqueue/IRequestProcessor;


# instance fields
.field private queue:Lcom/android/volley/RequestQueue;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 15
    invoke-static {p1}, Lcom/android/volley/toolbox/Volley;->newRequestQueue(Landroid/content/Context;)Lcom/android/volley/RequestQueue;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;->queue:Lcom/android/volley/RequestQueue;

    .line 17
    return-void
.end method


# virtual methods
.method public add(Lcom/android/volley/Request;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/android/volley/Request",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 21
    .local p1, "request":Lcom/android/volley/Request;, "Lcom/android/volley/Request<TT;>;"
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;->queue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->add(Lcom/android/volley/Request;)Lcom/android/volley/Request;

    .line 22
    return-void
.end method

.method public cancelAll(Ljava/lang/Object;)V
    .locals 1
    .param p1, "tag"    # Ljava/lang/Object;

    .prologue
    .line 26
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/requestqueue/impl/WemoRequestProcessor;->queue:Lcom/android/volley/RequestQueue;

    invoke-virtual {v0, p1}, Lcom/android/volley/RequestQueue;->cancelAll(Ljava/lang/Object;)V

    .line 27
    return-void
.end method
