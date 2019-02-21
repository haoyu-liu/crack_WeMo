.class Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;
.super Ljava/lang/Object;
.source "MarketingDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismissWithAnimation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)V
    .locals 0

    .prologue
    .line 954
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 958
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v1, v1, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment;->access$200(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingMessage;

    move-result-object v1

    const-string v2, "location"

    invoke-virtual {v1, v2}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 961
    .local v0, "location":Ljava/lang/String;
    const-string v1, "center"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 963
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$700(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/widget/RelativeLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$600(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/view/animation/TranslateAnimation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    .line 980
    :cond_0
    :goto_0
    return-void

    .line 966
    :cond_1
    const-string v1, "full"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 968
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$700(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/widget/RelativeLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$800(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/view/animation/TranslateAnimation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 971
    :cond_2
    const-string v1, "top"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 973
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$700(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/widget/RelativeLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$900(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/view/animation/TranslateAnimation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0

    .line 976
    :cond_3
    const-string v1, "bottom"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 978
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$700(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/widget/RelativeLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$5;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1000(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/view/animation/TranslateAnimation;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/RelativeLayout;->startAnimation(Landroid/view/animation/Animation;)V

    goto :goto_0
.end method
