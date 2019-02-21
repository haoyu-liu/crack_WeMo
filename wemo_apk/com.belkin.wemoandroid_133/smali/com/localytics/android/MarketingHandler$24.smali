.class Lcom/localytics/android/MarketingHandler$24;
.super Lcom/localytics/android/MarketingCallable;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->_getJavaScriptClientCallbacks(Ljava/util/Map;)Landroid/util/SparseArray;
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
    .line 2795
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$24;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2799
    const/4 v2, 0x0

    aget-object v2, p1, v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2800
    .local v0, "dimension":I
    const/4 v2, 0x1

    aget-object v1, p1, v2

    check-cast v1, Ljava/lang/String;

    .line 2801
    .local v1, "value":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$24;->this$0:Lcom/localytics/android/MarketingHandler;

    iget-object v2, v2, Lcom/localytics/android/MarketingHandler;->mLocalyticsDao:Lcom/localytics/android/LocalyticsDao;

    invoke-interface {v2, v0, v1}, Lcom/localytics/android/LocalyticsDao;->setCustomDimension(ILjava/lang/String;)V

    .line 2803
    const/4 v2, 0x0

    return-object v2
.end method
