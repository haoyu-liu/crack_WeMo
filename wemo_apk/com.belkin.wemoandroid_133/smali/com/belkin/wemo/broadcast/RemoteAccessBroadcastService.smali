.class public Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;
.super Ljava/lang/Object;
.source "RemoteAccessBroadcastService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;
    }
.end annotation


# static fields
.field private static broadcastService:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private remoteAccessListenerSet:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set",
            "<",
            "Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->TAG:Ljava/lang/String;

    .line 16
    return-void
.end method

.method public static declared-synchronized getInstance()Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;
    .locals 2

    .prologue
    .line 19
    const-class v1, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->broadcastService:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    invoke-direct {v0}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;-><init>()V

    sput-object v0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->broadcastService:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;

    .line 22
    :cond_0
    sget-object v0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->broadcastService:Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 19
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public addRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z
    .locals 3
    .param p1, "listener"    # Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    .prologue
    .line 29
    iget-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remote Access Listener Added: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    iget-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public clearRemoteAccessListenerList()V
    .locals 1

    .prologue
    .line 39
    iget-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 40
    return-void
.end method

.method public remoteDisabledNotify()V
    .locals 4

    .prologue
    .line 55
    iget-object v2, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->TAG:Ljava/lang/String;

    const-string v3, "Remote Access disabled: Notifying listeners."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    iget-object v2, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    .line 57
    .local v1, "listener":Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;
    invoke-interface {v1}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;->onRemoteAccessDisabled()V

    goto :goto_0

    .line 59
    .end local v1    # "listener":Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;
    :cond_0
    return-void
.end method

.method public remoteEnabledNotify()V
    .locals 4

    .prologue
    .line 48
    iget-object v2, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->TAG:Ljava/lang/String;

    const-string v3, "Remote Access enabled: Notifying listeners."

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    iget-object v2, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    .line 50
    .local v1, "listener":Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;
    invoke-interface {v1}, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;->onRemoteAccessEnabled()V

    goto :goto_0

    .line 52
    .end local v1    # "listener":Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;
    :cond_0
    return-void
.end method

.method public removeRemoteAccessListener(Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;)Z
    .locals 3
    .param p1, "listener"    # Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService$RemoteAccessListener;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Remote Access Listener Removed: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    iget-object v0, p0, Lcom/belkin/wemo/broadcast/RemoteAccessBroadcastService;->remoteAccessListenerSet:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
