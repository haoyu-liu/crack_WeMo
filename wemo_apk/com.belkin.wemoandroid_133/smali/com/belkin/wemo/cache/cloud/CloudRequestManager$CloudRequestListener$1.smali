.class Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "CloudRequestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->onErrorResponse(Lcom/android/volley/VolleyError;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

.field final synthetic val$error:Lcom/android/volley/VolleyError;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;Lcom/android/volley/VolleyError;)V
    .locals 0

    .prologue
    .line 82
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->val$error:Lcom/android/volley/VolleyError;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .prologue
    .line 85
    const/4 v0, 0x0

    .line 86
    .local v0, "data":[B
    const/4 v3, -0x1

    .line 88
    .local v3, "statusCode":I
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->val$error:Lcom/android/volley/VolleyError;

    if-eqz v4, :cond_0

    .line 89
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->val$error:Lcom/android/volley/VolleyError;

    iget-object v1, v4, Lcom/android/volley/VolleyError;->networkResponse:Lcom/android/volley/NetworkResponse;

    .line 90
    .local v1, "networkresponse":Lcom/android/volley/NetworkResponse;
    if-eqz v1, :cond_0

    .line 91
    iget v3, v1, Lcom/android/volley/NetworkResponse;->statusCode:I

    .line 92
    iget-object v0, v1, Lcom/android/volley/NetworkResponse;->data:[B

    .line 95
    .end local v1    # "networkresponse":Lcom/android/volley/NetworkResponse;
    :cond_0
    const-string v2, "null"

    .line 96
    .local v2, "response":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 97
    new-instance v2, Ljava/lang/String;

    .end local v2    # "response":Ljava/lang/String;
    invoke-direct {v2, v0}, Ljava/lang/String;-><init>([B)V

    .line 99
    .restart local v2    # "response":Ljava/lang/String;
    :cond_1
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->TAG:Ljava/lang/String;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "Cloud Request FALIED: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    iget-object v6, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v6}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Status: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, "; Response: "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v4}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v4

    const/4 v5, 0x0

    invoke-interface {v4, v5, v3, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    .line 102
    iget-object v4, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    iget-object v4, v4, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v5, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$1;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 103
    return-void
.end method
