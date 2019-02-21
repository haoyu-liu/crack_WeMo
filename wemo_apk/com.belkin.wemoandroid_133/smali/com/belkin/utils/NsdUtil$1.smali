.class Lcom/belkin/utils/NsdUtil$1;
.super Ljava/lang/Object;
.source "NsdUtil.java"

# interfaces
.implements Landroid/net/nsd/NsdManager$ResolveListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/NsdUtil;->initializeResolveListener()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/NsdUtil;


# direct methods
.method constructor <init>(Lcom/belkin/utils/NsdUtil;)V
    .locals 0

    .prologue
    .line 45
    iput-object p1, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onResolveFailed(Landroid/net/nsd/NsdServiceInfo;I)V
    .locals 3
    .param p1, "serviceInfo"    # Landroid/net/nsd/NsdServiceInfo;
    .param p2, "errorCode"    # I

    .prologue
    .line 49
    const-string v0, "NsdUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Resolve failed"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    return-void
.end method

.method public onServiceResolved(Landroid/net/nsd/NsdServiceInfo;)V
    .locals 6
    .param p1, "serviceInfo"    # Landroid/net/nsd/NsdServiceInfo;

    .prologue
    const/4 v5, 0x1

    .line 54
    const-string v2, "NsdUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Resolve Succeeded. "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceName()Ljava/lang/String;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->mServiceName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 57
    const-string v2, "NsdUtil"

    const-string v3, "Same IP."

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    :goto_0
    return-void

    .line 60
    :cond_0
    iget-object v2, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iput-object p1, v2, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    .line 61
    iget-object v2, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v2, v2, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    invoke-virtual {v2}, Landroid/net/nsd/NsdServiceInfo;->getPort()I

    move-result v1

    .line 62
    .local v1, "port":I
    iget-object v2, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v2, v2, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    invoke-virtual {v2}, Landroid/net/nsd/NsdServiceInfo;->getHost()Ljava/net/InetAddress;

    move-result-object v0

    .line 63
    .local v0, "host":Ljava/net/InetAddress;
    iget-object v2, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    invoke-virtual {v0}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v3

    iput-object v3, v2, Lcom/belkin/utils/NsdUtil;->hostAdress:Ljava/lang/String;

    .line 64
    const-string v2, "NsdUtil"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "port: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "host: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, "ipAdress: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v4, v4, Lcom/belkin/utils/NsdUtil;->hostAdress:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    iget-object v2, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    invoke-static {v2}, Lcom/belkin/utils/NsdUtil;->access$000(Lcom/belkin/utils/NsdUtil;)Lcom/belkin/wemo/cache/utils/SharePreferences;

    move-result-object v2

    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$1;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->hostAdress:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/belkin/wemo/cache/utils/SharePreferences;->saveWemoBridgeIpAdress(Ljava/lang/String;)V

    goto :goto_0
.end method
