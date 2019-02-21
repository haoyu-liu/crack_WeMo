.class Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "CloudRequestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->onResponse(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

.field final synthetic val$response:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 110
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    iput-object p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->val$response:Ljava/lang/String;

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    const/16 v4, 0xc8

    .line 114
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Cloud Request PASSED: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Status: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "; Response: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->val$response:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->val$response:Ljava/lang/String;

    if-nez v1, :cond_0

    const/4 v0, 0x0

    .line 117
    .local v0, "data":[B
    :goto_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v1

    const/4 v2, 0x1

    invoke-interface {v1, v2, v4, v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    .line 119
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    iget-object v1, v1, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;

    invoke-static {v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;->access$000(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 120
    return-void

    .line 116
    .end local v0    # "data":[B
    :cond_0
    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$CloudRequestListener$2;->val$response:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    goto :goto_0
.end method
