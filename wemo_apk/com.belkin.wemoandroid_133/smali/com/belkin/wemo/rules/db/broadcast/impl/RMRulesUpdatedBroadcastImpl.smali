.class public Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;
.super Ljava/lang/Object;
.source "RMRulesUpdatedBroadcastImpl.java"

# interfaces
.implements Lcom/belkin/wemo/rules/db/broadcast/RMIRulesUpdatedBroadcaster;


# static fields
.field private static final TAG:Ljava/lang/String;


# instance fields
.field private listenerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    const-class v0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->TAG:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 16
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    .line 17
    return-void
.end method


# virtual methods
.method public registerOnRulesUpdatedListener(Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;

    .prologue
    .line 21
    if-eqz p1, :cond_0

    .line 22
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    :cond_0
    return-void
.end method

.method public sendRulesUpdatedBroadcast()V
    .locals 5

    .prologue
    .line 28
    sget-object v2, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Fetch Rules: Rules have been updated. Sending broadcast to listeners. Listener count: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/belkin/wemo/cache/utils/SDKLogUtils;->debugLog(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    iget-object v2, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .local v0, "i$":Ljava/util/Iterator;
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;

    .line 30
    .local v1, "listener":Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;
    invoke-interface {v1}, Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;->onRulesDBUpdated()V

    goto :goto_0

    .line 32
    .end local v1    # "listener":Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;
    :cond_0
    return-void
.end method

.method public unregisterAllOnRulesUpdatedListeners()V
    .locals 1

    .prologue
    .line 42
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 43
    return-void
.end method

.method public unregisterOnRulesUpdatedListener(Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;)V
    .locals 1
    .param p1, "listener"    # Lcom/belkin/wemo/rules/db/listener/RMOnRulesUpdatedListener;

    .prologue
    .line 37
    iget-object v0, p0, Lcom/belkin/wemo/rules/db/broadcast/impl/RMRulesUpdatedBroadcastImpl;->listenerList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 38
    return-void
.end method
