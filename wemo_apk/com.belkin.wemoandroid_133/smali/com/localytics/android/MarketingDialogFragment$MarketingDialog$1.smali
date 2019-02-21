.class Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$1;
.super Ljava/lang/Object;
.source "MarketingDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;-><init>(Lcom/localytics/android/MarketingDialogFragment;Landroid/content/Context;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

.field final synthetic val$this$0:Lcom/localytics/android/MarketingDialogFragment;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;Lcom/localytics/android/MarketingDialogFragment;)V
    .locals 0

    .prologue
    .line 728
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$1;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iput-object p2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$1;->val$this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 732
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$1;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->dismiss()V

    .line 733
    return-void
.end method
