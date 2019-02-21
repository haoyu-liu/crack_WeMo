.class Lcom/localytics/android/MarketingDialogFragment$1;
.super Lcom/localytics/android/MarketingCallable;
.source "MarketingDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingDialogFragment;->setJavaScriptClient(Lcom/localytics/android/JavaScriptClient;)Lcom/localytics/android/MarketingDialogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/localytics/android/MarketingDialogFragment;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment;)V
    .locals 0

    .prologue
    .line 370
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$1;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-direct {p0}, Lcom/localytics/android/MarketingCallable;-><init>()V

    return-void
.end method


# virtual methods
.method call([Ljava/lang/Object;)Ljava/lang/Object;
    .locals 4
    .param p1, "params"    # [Ljava/lang/Object;

    .prologue
    .line 374
    const/4 v2, 0x0

    aget-object v1, p1, v2

    check-cast v1, Ljava/lang/String;

    .line 375
    .local v1, "url":Ljava/lang/String;
    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$1;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment;->access$000(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    move-result-object v2

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$100(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    move-result-object v0

    .line 376
    .local v0, "mWebView":Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;
    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$1;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    iget-object v3, p0, Lcom/localytics/android/MarketingDialogFragment$1;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-virtual {v3}, Lcom/localytics/android/MarketingDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-virtual {v2, v1, v3}, Lcom/localytics/android/MarketingDialogFragment;->handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 378
    new-instance v2, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v3, Lcom/localytics/android/MarketingDialogFragment$1$1;

    invoke-direct {v3, p0, v0, v1}, Lcom/localytics/android/MarketingDialogFragment$1$1;-><init>(Lcom/localytics/android/MarketingDialogFragment$1;Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 386
    :cond_0
    const/4 v2, 0x0

    return-object v2
.end method
