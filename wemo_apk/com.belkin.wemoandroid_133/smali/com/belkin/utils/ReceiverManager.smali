.class public Lcom/belkin/utils/ReceiverManager;
.super Ljava/lang/Object;
.source "ReceiverManager.java"


# static fields
.field private static receivers:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/content/BroadcastReceiver;",
            ">;"
        }
    .end annotation
.end field

.field private static ref:Lcom/belkin/utils/ReceiverManager;


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/belkin/utils/ReceiverManager;->receivers:Ljava/util/List;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lcom/belkin/utils/ReceiverManager;->context:Landroid/content/Context;

    .line 19
    return-void
.end method

.method public static declared-synchronized init(Landroid/content/Context;)Lcom/belkin/utils/ReceiverManager;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 22
    const-class v1, Lcom/belkin/utils/ReceiverManager;

    monitor-enter v1

    :try_start_0
    sget-object v0, Lcom/belkin/utils/ReceiverManager;->ref:Lcom/belkin/utils/ReceiverManager;

    if-nez v0, :cond_0

    new-instance v0, Lcom/belkin/utils/ReceiverManager;

    invoke-direct {v0, p0}, Lcom/belkin/utils/ReceiverManager;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/belkin/utils/ReceiverManager;->ref:Lcom/belkin/utils/ReceiverManager;

    .line 23
    :cond_0
    sget-object v0, Lcom/belkin/utils/ReceiverManager;->ref:Lcom/belkin/utils/ReceiverManager;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v1

    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0
.end method


# virtual methods
.method public isReceiverRegistered(Landroid/content/BroadcastReceiver;)Z
    .locals 2
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 33
    sget-object v1, Lcom/belkin/utils/ReceiverManager;->receivers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    .line 34
    .local v0, "registered":Z
    return v0
.end method

.method public registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;
    .locals 2
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;
    .param p2, "intentFilter"    # Landroid/content/IntentFilter;

    .prologue
    .line 27
    sget-object v1, Lcom/belkin/utils/ReceiverManager;->receivers:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    iget-object v1, p0, Lcom/belkin/utils/ReceiverManager;->context:Landroid/content/Context;

    invoke-virtual {v1, p1, p2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    move-result-object v0

    .line 29
    .local v0, "intent":Landroid/content/Intent;
    return-object v0
.end method

.method public unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    .locals 1
    .param p1, "receiver"    # Landroid/content/BroadcastReceiver;

    .prologue
    .line 39
    sget-object v0, Lcom/belkin/utils/ReceiverManager;->receivers:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 40
    iget-object v0, p0, Lcom/belkin/utils/ReceiverManager;->context:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 42
    return-void
.end method
