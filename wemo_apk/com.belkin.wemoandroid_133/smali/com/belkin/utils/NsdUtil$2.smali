.class Lcom/belkin/utils/NsdUtil$2;
.super Ljava/lang/Object;
.source "NsdUtil.java"

# interfaces
.implements Landroid/net/nsd/NsdManager$DiscoveryListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/belkin/utils/NsdUtil;->initializeDiscoveryListener(Lorg/apache/cordova/CallbackContext;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/belkin/utils/NsdUtil;

.field final synthetic val$callbackContext:Lorg/apache/cordova/CallbackContext;


# direct methods
.method constructor <init>(Lcom/belkin/utils/NsdUtil;Lorg/apache/cordova/CallbackContext;)V
    .locals 0

    .prologue
    .line 71
    iput-object p1, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iput-object p2, p0, Lcom/belkin/utils/NsdUtil$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDiscoveryStarted(Ljava/lang/String;)V
    .locals 2
    .param p1, "regType"    # Ljava/lang/String;

    .prologue
    .line 74
    const-string v0, "NsdUtil"

    const-string v1, "Service discovery started"

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    return-void
.end method

.method public onDiscoveryStopped(Ljava/lang/String;)V
    .locals 3
    .param p1, "serviceType"    # Ljava/lang/String;

    .prologue
    .line 107
    const-string v0, "NsdUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery stopped: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->infoLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 108
    return-void
.end method

.method public onServiceFound(Landroid/net/nsd/NsdServiceInfo;)V
    .locals 6
    .param p1, "service"    # Landroid/net/nsd/NsdServiceInfo;

    .prologue
    .line 78
    const-string v3, "NsdUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Service discovery success"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceName()Ljava/lang/String;

    move-result-object v0

    .line 80
    .local v0, "bridgeName":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getPort()I

    move-result v2

    .line 81
    .local v2, "port":I
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getHost()Ljava/net/InetAddress;

    move-result-object v1

    .line 82
    .local v1, "host":Ljava/net/InetAddress;
    const-string v3, "NsdUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "port: :"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "host: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceType()Ljava/lang/String;

    move-result-object v3

    const-string v4, "_hap._tcp."

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 84
    const-string v3, "NsdUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Unknown Service Type: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceType()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 96
    :cond_0
    :goto_0
    return-void

    .line 85
    :cond_1
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->mServiceName:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_2

    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->mServiceNameBridge:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 86
    :cond_2
    const-string v3, "NsdUtil"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "Bridge Discovered: "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v5, v5, Lcom/belkin/utils/NsdUtil;->mServiceName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/belkin/utils/LogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    iget-object v4, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v4, v4, Lcom/belkin/utils/NsdUtil;->mResolveListener:Landroid/net/nsd/NsdManager$ResolveListener;

    invoke-virtual {v3, p1, v4}, Landroid/net/nsd/NsdManager;->resolveService(Landroid/net/nsd/NsdServiceInfo;Landroid/net/nsd/NsdManager$ResolveListener;)V

    .line 88
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    if-eqz v3, :cond_3

    .line 89
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->val$callbackContext:Lorg/apache/cordova/CallbackContext;

    invoke-virtual {v3}, Lorg/apache/cordova/CallbackContext;->success()V

    .line 91
    :cond_3
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    invoke-virtual {v3}, Lcom/belkin/utils/NsdUtil;->stopDiscovery()V

    goto :goto_0

    .line 93
    :cond_4
    invoke-virtual {p1}, Landroid/net/nsd/NsdServiceInfo;->getServiceName()Ljava/lang/String;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v4, v4, Lcom/belkin/utils/NsdUtil;->mServiceName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 94
    iget-object v3, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v3, v3, Lcom/belkin/utils/NsdUtil;->mNsdManager:Landroid/net/nsd/NsdManager;

    iget-object v4, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v4, v4, Lcom/belkin/utils/NsdUtil;->mResolveListener:Landroid/net/nsd/NsdManager$ResolveListener;

    invoke-virtual {v3, p1, v4}, Landroid/net/nsd/NsdManager;->resolveService(Landroid/net/nsd/NsdServiceInfo;Landroid/net/nsd/NsdManager$ResolveListener;)V

    goto :goto_0
.end method

.method public onServiceLost(Landroid/net/nsd/NsdServiceInfo;)V
    .locals 3
    .param p1, "service"    # Landroid/net/nsd/NsdServiceInfo;

    .prologue
    .line 99
    const-string v0, "NsdUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "service lost"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 100
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    iget-object v0, v0, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    if-ne v0, p1, :cond_0

    .line 101
    iget-object v0, p0, Lcom/belkin/utils/NsdUtil$2;->this$0:Lcom/belkin/utils/NsdUtil;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/belkin/utils/NsdUtil;->mService:Landroid/net/nsd/NsdServiceInfo;

    .line 103
    :cond_0
    return-void
.end method

.method public onStartDiscoveryFailed(Ljava/lang/String;I)V
    .locals 3
    .param p1, "serviceType"    # Ljava/lang/String;
    .param p2, "errorCode"    # I

    .prologue
    .line 111
    const-string v0, "NsdUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery failed: Error code:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    return-void
.end method

.method public onStopDiscoveryFailed(Ljava/lang/String;I)V
    .locals 3
    .param p1, "serviceType"    # Ljava/lang/String;
    .param p2, "errorCode"    # I

    .prologue
    .line 116
    const-string v0, "NsdUtil"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Discovery failed: Error code:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/utils/LogUtils;->errorLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 118
    return-void
.end method
