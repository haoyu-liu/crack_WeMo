.class final Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;
.super Lcom/localytics/android/BaseHandler$ListenersSet;
.source "AnalyticsHandler.java"

# interfaces
.implements Lcom/localytics/android/AnalyticsListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/AnalyticsHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AnalyticsListenersSet"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/AnalyticsHandler;


# direct methods
.method private constructor <init>(Lcom/localytics/android/AnalyticsHandler;)V
    .locals 0

    .prologue
    .line 1894
    iput-object p1, p0, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;->this$0:Lcom/localytics/android/AnalyticsHandler;

    invoke-direct {p0, p1}, Lcom/localytics/android/BaseHandler$ListenersSet;-><init>(Lcom/localytics/android/BaseHandler;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/localytics/android/AnalyticsHandler;Lcom/localytics/android/AnalyticsHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/localytics/android/AnalyticsHandler;
    .param p2, "x1"    # Lcom/localytics/android/AnalyticsHandler$1;

    .prologue
    .line 1894
    invoke-direct {p0, p1}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;-><init>(Lcom/localytics/android/AnalyticsHandler;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized localyticsDidTagEvent(Ljava/lang/String;Ljava/util/Map;J)V
    .locals 5
    .param p1, "eventName"    # Ljava/lang/String;
    .param p3, "clv"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;J)V"
        }
    .end annotation

    .prologue
    .line 1917
    .local p2, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsDidTagEvent"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    const-class v3, Ljava/lang/String;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    const-class v3, Ljava/util/Map;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    aput-object p2, v2, v3

    const/4 v3, 0x2

    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1918
    monitor-exit p0

    return-void

    .line 1917
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsSessionDidOpen(ZZZ)V
    .locals 5
    .param p1, "isFirstEverSession"    # Z
    .param p2, "isFirstSessionSinceUpgrade"    # Z
    .param p3, "didResumeOldSession"    # Z

    .prologue
    .line 1905
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsSessionDidOpen"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1906
    monitor-exit p0

    return-void

    .line 1905
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsSessionWillClose()V
    .locals 3

    .prologue
    .line 1911
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsSessionWillClose"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1912
    monitor-exit p0

    return-void

    .line 1911
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsSessionWillOpen(ZZZ)V
    .locals 5
    .param p1, "isFirstEverSession"    # Z
    .param p2, "isFirstSessionSinceUpgrade"    # Z
    .param p3, "willResumeOldSession"    # Z

    .prologue
    .line 1899
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsSessionWillOpen"

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/Class;

    const/4 v2, 0x0

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x1

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x2

    sget-object v3, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v3, v1, v2

    const/4 v2, 0x3

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x1

    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    const/4 v3, 0x2

    invoke-static {p3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/AnalyticsHandler$AnalyticsListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1900
    monitor-exit p0

    return-void

    .line 1899
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
