.class Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;
.super Lcom/belkin/wemo/runnable/WeMoRunnable;
.source "CloudRequestManager.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->onResponse([BI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

.field final synthetic val$response:[B

.field final synthetic val$statusCode:I


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;I[B)V
    .locals 0

    .prologue
    .line 165
    iput-object p1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    iput p2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$statusCode:I

    iput-object p3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$response:[B

    invoke-direct {p0}, Lcom/belkin/wemo/runnable/WeMoRunnable;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 169
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Byte Stream Cloud Request PASSED: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    invoke-static {v2}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Status: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$statusCode:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; Response: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$response:[B

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    invoke-static {v0}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v0

    const/4 v1, 0x1

    iget v2, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$statusCode:I

    iget-object v3, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->val$response:[B

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;->requestComplete(ZI[B)V

    .line 173
    iget-object v0, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    iget-object v0, v0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->this$0:Lcom/belkin/wemo/cache/cloud/CloudRequestManager;

    iget-object v1, p0, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener$2;->this$1:Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;

    invoke-static {v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;->access$200(Lcom/belkin/wemo/cache/cloud/CloudRequestManager$ByteStreamResponseListener;)Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/cloud/CloudRequestManager;->access$100(Lcom/belkin/wemo/cache/cloud/CloudRequestManager;Lcom/belkin/wemo/cache/cloud/CloudRequestInterface;)V

    .line 174
    return-void
.end method
