.class Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;
.super Ljava/lang/Object;
.source "CloudRequestManager.java"

# interfaces
.implements Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;
.implements Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ByteStreamResponseListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestErrorListener;",
        "Lcom/belkin/wemo/cache/cloud/request/listener/WemoRequestSuccessListener",
        "<[B>;"
    }
.end annotation


# instance fields
.field private requestInterface:Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

.field final synthetic this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;


# direct methods
.method public constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V
    .locals 0
    .param p2, "requestInterface"    # Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .prologue
    .line 129
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 130
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->requestInterface:Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .line 131
    return-void
.end method

.method static synthetic access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    .prologue
    .line 125
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->requestInterface:Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    return-object v0
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 136
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$1;

    invoke-direct {v1, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$1;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;Lcom/android/volley/VolleyError;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 160
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;I)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;
    .param p2, "x1"    # I

    .prologue
    .line 125
    check-cast p1, [B

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1, p2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->onResponse([BI)V

    return-void
.end method

.method public onResponse([BI)V
    .locals 2
    .param p1, "response"    # [B
    .param p2, "statusCode"    # I

    .prologue
    .line 165
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;

    invoke-direct {v1, p0, p2, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;I[B)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 176
    return-void
.end method
