.class Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$4;
.super Ljava/lang/Object;
.source "MarketingDialogFragment.java"

# interfaces
.implements Landroid/view/animation/Animation$AnimationListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->createAnimations()V
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
    .line 844
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$4;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationEnd(Landroid/view/animation/Animation;)V
    .locals 4
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 854
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$4;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v1, v1, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment;->access$500(Lcom/localytics/android/MarketingDialogFragment;)Landroid/util/SparseArray;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 856
    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$4;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v1, v1, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v1}, Lcom/localytics/android/MarketingDialogFragment;->access$500(Lcom/localytics/android/MarketingDialogFragment;)Landroid/util/SparseArray;

    move-result-object v1

    const/16 v2, 0x10

    invoke-virtual {v1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/localytics/android/MarketingCallable;

    .line 857
    .local v0, "callable":Lcom/localytics/android/MarketingCallable;
    invoke-static {}, Lcom/localytics/android/Constants;->isTestModeEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    if-eqz v0, :cond_0

    .line 859
    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$4;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v3, v3, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v3}, Lcom/localytics/android/MarketingDialogFragment;->access$200(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingMessage;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingCallable;->call([Ljava/lang/Object;)Ljava/lang/Object;

    .line 862
    .end local v0    # "callable":Lcom/localytics/android/MarketingCallable;
    :cond_0
    return-void
.end method

.method public onAnimationRepeat(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 868
    return-void
.end method

.method public onAnimationStart(Landroid/view/animation/Animation;)V
    .locals 0
    .param p1, "animation"    # Landroid/view/animation/Animation;

    .prologue
    .line 849
    return-void
.end method
