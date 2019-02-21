.class public Lcom/belkin/wemo/cache/utils/Locks;
.super Ljava/lang/Object;
.source "Locks.java"


# static fields
.field public static final LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

.field public static final LOCK_GET_DEVICE_LIST_SYNC:Ljava/lang/Integer;

.field public static final LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

.field public static final LOCK_UNICAST_DISOCVERY:Ljava/lang/Integer;

.field private static ourInstance:Lcom/belkin/wemo/cache/utils/Locks;


# instance fields
.field private locksArray:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 7
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_REMOTE_ACCESS_ENABLE:Ljava/lang/Integer;

    .line 8
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST:Ljava/lang/Integer;

    .line 9
    const/4 v0, 0x2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_GET_DEVICE_LIST_SYNC:Ljava/lang/Integer;

    .line 10
    const/4 v0, 0x3

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    sput-object v0, Lcom/belkin/wemo/cache/utils/Locks;->LOCK_UNICAST_DISOCVERY:Ljava/lang/Integer;

    .line 13
    new-instance v0, Lcom/belkin/wemo/cache/utils/Locks;

    invoke-direct {v0}, Lcom/belkin/wemo/cache/utils/Locks;-><init>()V

    sput-object v0, Lcom/belkin/wemo/cache/utils/Locks;->ourInstance:Lcom/belkin/wemo/cache/utils/Locks;

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .prologue
    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/Locks;->locksArray:Ljava/util/ArrayList;

    .line 20
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/belkin/wemo/cache/utils/Locks;->locksArray:Ljava/util/ArrayList;

    .line 21
    return-void
.end method

.method public static getInstance()Lcom/belkin/wemo/cache/utils/Locks;
    .locals 1

    .prologue
    .line 16
    sget-object v0, Lcom/belkin/wemo/cache/utils/Locks;->ourInstance:Lcom/belkin/wemo/cache/utils/Locks;

    return-object v0
.end method


# virtual methods
.method public declared-synchronized isLocked(Ljava/lang/Integer;)Z
    .locals 1
    .param p1, "lockID"    # Ljava/lang/Integer;

    .prologue
    .line 35
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/Locks;->locksArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v0

    if-eqz v0, :cond_0

    .line 37
    const/4 v0, 0x1

    .line 39
    :goto_0
    monitor-exit p0

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0

    .line 35
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized setLock(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "lockID"    # Ljava/lang/Integer;

    .prologue
    .line 25
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/Locks;->locksArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    monitor-exit p0

    return-void

    .line 25
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized unsetLock(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "lockID"    # Ljava/lang/Integer;

    .prologue
    .line 30
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lcom/belkin/wemo/cache/utils/Locks;->locksArray:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    .line 30
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
