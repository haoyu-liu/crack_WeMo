.class final Lcom/localytics/android/MarketingHandler$MessagingListenersSet;
.super Lcom/localytics/android/BaseHandler$ListenersSet;
.source "MarketingHandler.java"

# interfaces
.implements Lcom/localytics/android/MessagingListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/MarketingHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "MessagingListenersSet"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;


# direct methods
.method private constructor <init>(Lcom/localytics/android/MarketingHandler;)V
    .locals 0

    .prologue
    .line 3278
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-direct {p0, p1}, Lcom/localytics/android/BaseHandler$ListenersSet;-><init>(Lcom/localytics/android/BaseHandler;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingHandler$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/localytics/android/MarketingHandler;
    .param p2, "x1"    # Lcom/localytics/android/MarketingHandler$1;

    .prologue
    .line 3278
    invoke-direct {p0, p1}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;-><init>(Lcom/localytics/android/MarketingHandler;)V

    return-void
.end method


# virtual methods
.method public declared-synchronized localyticsDidDismissInAppMessage()V
    .locals 3

    .prologue
    .line 3306
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsDidDismissInAppMessage"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3307
    monitor-exit p0

    return-void

    .line 3306
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsDidDisplayInAppMessage()V
    .locals 3

    .prologue
    .line 3294
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsDidDisplayInAppMessage"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3295
    monitor-exit p0

    return-void

    .line 3294
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsWillDismissInAppMessage()V
    .locals 3

    .prologue
    .line 3300
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsWillDismissInAppMessage"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3301
    monitor-exit p0

    return-void

    .line 3300
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized localyticsWillDisplayInAppMessage()V
    .locals 3

    .prologue
    .line 3288
    monitor-enter p0

    :try_start_0
    const-string v0, "localyticsWillDisplayInAppMessage"

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lcom/localytics/android/MarketingHandler$MessagingListenersSet;->callListeners(Ljava/lang/String;[Ljava/lang/Class;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3289
    monitor-exit p0

    return-void

    .line 3288
    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
