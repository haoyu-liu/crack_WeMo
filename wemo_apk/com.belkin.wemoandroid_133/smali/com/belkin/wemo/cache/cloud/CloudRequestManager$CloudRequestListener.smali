.class Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;
.super Ljava/lang/Object;
.source "CloudRequestManager.java"

# interfaces
.implements Lcom/android/volley/Response$Listener;
.implements Lcom/android/volley/Response$ErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "CloudRequestListener"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/android/volley/Response$Listener",
        "<",
        "Ljava/lang/String;",
        ">;",
        "Lcom/android/volley/Response$ErrorListener;"
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
    .line 75
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->requestInterface:Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    .line 77
    return-void
.end method

.method static synthetic access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;
    .locals 1
    .param p0, "x0"    # Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    .prologue
    .line 71
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->requestInterface:Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    return-object v0
.end method


# virtual methods
.method public onErrorResponse(Lcom/android/volley/VolleyError;)V
    .locals 2
    .param p1, "error"    # Lcom/android/volley/VolleyError;

    .prologue
    .line 82
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;

    invoke-direct {v1, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;Lcom/android/volley/VolleyError;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 105
    return-void
.end method

.method public bridge synthetic onResponse(Ljava/lang/Object;)V
    .locals 0
    .param p1, "x0"    # Ljava/lang/Object;

    .prologue
    .line 71
    check-cast p1, Ljava/lang/String;

    .end local p1    # "x0":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->onResponse(Ljava/lang/String;)V

    return-void
.end method

.method public onResponse(Ljava/lang/String;)V
    .locals 2
    .param p1, "response"    # Ljava/lang/String;

    .prologue
    .line 110
    invoke-static {}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->getInstance()Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;

    move-result-object v0

    new-instance v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;

    invoke-direct {v1, p0, p1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;-><init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/belkin/wemo/thread/WeMoThreadPoolHandler;->executeViaBackground(Lcom/belkin/wemo/runnable/WeMoRunnable;)V

    .line 122
    return-void
.end method
