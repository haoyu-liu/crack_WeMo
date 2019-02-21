.class Lcom/localytics/android/MarketingHandler$11;
.super Lcom/localytics/android/MarketingCallable;
.source "MarketingHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingHandler;->__showMarketingTest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingHandler;

.field final synthetic val$button:Lcom/localytics/android/TestModeButton;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingHandler;Lcom/localytics/android/TestModeButton;)V
    .locals 0

    .prologue
    .line 2268
    iput-object p1, p0, Lcom/localytics/android/MarketingHandler$11;->this$0:Lcom/localytics/android/MarketingHandler;

    iput-object p2, p0, Lcom/localytics/android/MarketingHandler$11;->val$button:Lcom/localytics/android/TestModeButton;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 3
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 2272
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$11;->val$button:Lcom/localytics/android/TestModeButton;

    iget-object v1, p0, Lcom/localytics/android/MarketingHandler$11;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v1}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v1

    const-string v2, "marketing_test_mode_button"

    invoke-virtual {v0, v1, v2}, Lcom/localytics/android/TestModeButton;->show(Landroid/support/v4/app/FragmentManager;Ljava/lang/String;)V

    .line 2273
    iget-object v0, p0, Lcom/localytics/android/MarketingHandler$11;->this$0:Lcom/localytics/android/MarketingHandler;

    invoke-static {v0}, Lcom/localytics/android/MarketingHandler;->access$300(Lcom/localytics/android/MarketingHandler;)Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v4/app/FragmentManager;->executePendingTransactions()Z

    .line 2274
    const/4 v0, 0x0

    return-object v0
.end method
