.class Lcom/localytics/android/MarketingHandler$17;
.super Lcom/localytics/android/MarketingCallable;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->getDialogCallbacks()Landroid/util/SparseArray;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;)V
    .locals 0

    .prologue
    .line 2565
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$17;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method public call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2569
    const/4 v2, 0x0

    aget-object v1, p1, v2

    check-cast v1, Ljava/lang/String;

    .line 2570
    .local v1, "event":Ljava/lang/String;
    const/4 v2, 0x1

    aget-object v0, p1, v2

    check-cast v0, Ljava/util/Map;

    .line 2572
    .local v0, "attributes":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$17;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2, v1, v0}, Lcom/localytics/android/LocalyticsDao;->tagEvent(Ljava/lang/String;Ljava/util/Map;)V

    .line 2573
    const/4 v2, 0x0

    return-object v2
.end method
