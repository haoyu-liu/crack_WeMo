.class public Lcom/soundcloud/android/crop/MonitoredActivity$LifeCycleAdapter;
.super Ljava/lang/Object;
.source "MonitoredActivity.java"

# interfaces
.implements Lcom/soundcloud/android/crop/MonitoredActivity$LifeCycleListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/soundcloud/android/crop/MonitoredActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LifeCycleAdapter"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityCreated(Lcom/soundcloud/android/crop/MonitoredActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/soundcloud/android/crop/MonitoredActivity;

    .prologue
    .line 39
    return-void
.end method

.method public onActivityDestroyed(Lcom/soundcloud/android/crop/MonitoredActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/soundcloud/android/crop/MonitoredActivity;

    .prologue
    .line 40
    return-void
.end method

.method public onActivityStarted(Lcom/soundcloud/android/crop/MonitoredActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/soundcloud/android/crop/MonitoredActivity;

    .prologue
    .line 41
    return-void
.end method

.method public onActivityStopped(Lcom/soundcloud/android/crop/MonitoredActivity;)V
    .locals 0
    .param p1, "activity"    # Lcom/soundcloud/android/crop/MonitoredActivity;

    .prologue
    .line 42
    return-void
.end method
