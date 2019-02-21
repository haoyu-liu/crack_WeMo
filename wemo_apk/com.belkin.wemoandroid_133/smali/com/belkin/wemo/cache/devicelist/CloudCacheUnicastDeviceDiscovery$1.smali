.class Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;
.super Lcom/loopj/android/http/AsyncHttpResponseHandler;
.source "CloudCacheUnicastDeviceDiscovery.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->isDeviceReachable(Ljava/lang/String;ILjava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

.field final synthetic val$ipAddress:Ljava/lang/String;

.field final synthetic val$port:I

.field final synthetic val$udn:Ljava/lang/String;

.field final synthetic val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;


# direct methods
.method constructor <init>(Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;Ljava/lang/String;Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;Ljava/lang/String;I)V
    .locals 0

    .prologue
    .line 27
    iput-object p1, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->this$0:Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;

    iput-object p2, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$udn:Ljava/lang/String;

    iput-object p3, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    iput-object p4, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$ipAddress:Ljava/lang/String;

    iput p5, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$port:I

    invoke-direct {p0}, Lcom/loopj/android/http/AsyncHttpResponseHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(I[Lorg/apache/http/Header;[BLjava/lang/Throwable;)V
    .locals 4
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lorg/apache/http/Header;
    .param p3, "errorResponse"    # [B
    .param p4, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 39
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unicast discovery failed retrying:: ; statusCode- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    if-eqz v0, :cond_0

    .line 41
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$ipAddress:Ljava/lang/String;

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$port:I

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$udn:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;->onDeviceNotDiscovered(Ljava/lang/String;ILjava/lang/String;)V

    .line 43
    :cond_0
    return-void
.end method

.method public onFinish()V
    .locals 2

    .prologue
    .line 52
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->access$000()Ljava/lang/String;

    move-result-object v0

    const-string v1, "onFinish: "

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    return-void
.end method

.method public onRetry(I)V
    .locals 3
    .param p1, "retryNum"    # I

    .prologue
    .line 47
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unicast discovery retrying:: No. of Retry - "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    return-void
.end method

.method public onSuccess(I[Lorg/apache/http/Header;[B)V
    .locals 4
    .param p1, "statusCode"    # I
    .param p2, "headers"    # [Lorg/apache/http/Header;
    .param p3, "response"    # [B

    .prologue
    .line 31
    invoke-static {}, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery;->access$000()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "unicast discovery successful:: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$udn:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; statusCode- "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    if-eqz v0, :cond_0

    .line 33
    iget-object v0, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$unicastListener:Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;

    iget-object v1, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$ipAddress:Ljava/lang/String;

    iget v2, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$port:I

    iget-object v3, p0, Lcom/belkin/wemo/cache/devicelist/CloudCacheUnicastDeviceDiscovery$1;->val$udn:Ljava/lang/String;

    invoke-interface {v0, v1, v2, v3}, Lcom/belkin/wemo/cache/devicelist/listener/UnicastListener;->onDeviceDiscovered(Ljava/lang/String;ILjava/lang/String;)V

    .line 35
    :cond_0
    return-void
.end method
