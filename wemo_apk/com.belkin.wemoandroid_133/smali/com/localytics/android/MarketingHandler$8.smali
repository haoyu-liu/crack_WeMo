.class Lcom/localytics/android/MarketingHandler$8;
.super Ljava/lang/Object;
.source "MarketingHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->_tryDisplayingInAppCampaign(Lcom/localytics/android/MarketingMessage;Ljava/util/Map;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;

.field final synthetic val$jsCallbacks:Landroid/util/SparseArray;

.field final synthetic val$marketingMessage:Lcom/localytics/android/MarketingMessage;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/MarketingMessage;Landroid/util/SparseArray;)V
    .locals 0

    .prologue
    .line 2048
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$8;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    iput-object p3, p0, Lcom/localytics/android/MarketingHandler$8;->val$jsCallbacks:Landroid/util/SparseArray;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 2052
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v2}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    if-nez v2, :cond_1

    .line 2116
    :cond_0
    :goto_0
    return-void

    .line 2059
    :cond_1
    :try_start_0
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v2}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v2

    const-string v3, "marketing_dialog"

    invoke-virtual {v2, v3}, Landroid/support/v4/app/FragmentManager;->findFragmentByTag(Ljava/lang/String;)Landroid/support/v4/app/Fragment;

    move-result-object v2

    if-nez v2, :cond_0

    .line 2064
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v2}, Lcom/localytics/android/MarketingHandler;->access$400(Lcom/localytics/android/MarketingHandler;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 2066
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8;->this$0:Lcom/localytics/android/MarketingHandler;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/localytics/android/MarketingHandler;->access$402(Lcom/localytics/android/MarketingHandler;Z)Z

    .line 2067
    iget-object v2, p0, Lcom/localytics/android/MarketingHandler$8;->val$marketingMessage:Lcom/localytics/android/MarketingMessage;

    const-string v3, "campaign_id"

    invoke-virtual {v2, v3}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 2068
    .local v0, "campaignId":I
    new-instance v2, Lcom/localytics/android/MarketingHandler$8$1;

    invoke-direct {v2, p0, v0}, Lcom/localytics/android/MarketingHandler$8$1;-><init>(Lcom/localytics/android/MarketingHandler$8;I)V

    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Void;

    invoke-virtual {v2, v3}, Lcom/localytics/android/MarketingHandler$8$1;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 2112
    .end local v0    # "campaignId":I
    :catch_0
    move-exception v1

    .line 2114
    .local v1, "e":Ljava/lang/Exception;
    const-class v2, Ljava/lang/RuntimeException;

    const-string v3, "Localytics library threw an uncaught exception"

    invoke-static {v2, v3, v1}, Lcom/localytics/android/LocalyticsManager;->throwOrLogError(Ljava/lang/Class;Ljava/lang/String;Ljava/lang/Exception;)Ljava/lang/Object;

    goto :goto_0
.end method
