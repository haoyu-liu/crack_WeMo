.class Lcom/localytics/android/LocalyticsManager$1;
.super Ljava/lang/Object;
.source "LocalyticsManager.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/LocalyticsManager;->dismissCurrentInAppMessage()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/LocalyticsManager;


# direct methods
.method constructor <init>(Lcom/localytics/android/LocalyticsManager;)V
    .locals 0

    .prologue
    .line 445
    iput-object p1, p0, Lcom/localytics/android/LocalyticsManager$1;->this$0:Lcom/localytics/android/LocalyticsManager;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 448
    iget-object v0, p0, Lcom/localytics/android/LocalyticsManager$1;->this$0:Lcom/localytics/android/LocalyticsManager;

    invoke-virtual {v0}, Lcom/localytics/android/LocalyticsManager;->getMarketingHandler()Lcom/localytics/android/MarketingHandler;

    move-result-object v0

    invoke-virtual {v0}, Lcom/localytics/android/MarketingHandler;->dismissCurrentInAppMessage()V

    .line 449
    return-void
.end method
