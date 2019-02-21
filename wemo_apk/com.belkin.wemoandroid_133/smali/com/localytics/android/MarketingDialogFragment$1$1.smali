.class Lcom/localytics/android/MarketingDialogFragment$1$1;
.super Ljava/lang/Object;
.source "MarketingDialogFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/localytics/android/MarketingDialogFragment$1;->call([Ljava/lang/Object;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingDialogFragment$1;

.field final synthetic val$mWebView:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

.field final synthetic val$url:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$1;Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 379
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$1$1;->this$1:Lcom/localytics/android/MarketingDialogFragment$1;

    iput-object p2, p0, Lcom/localytics/android/MarketingDialogFragment$1$1;->val$mWebView:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iput-object p3, p0, Lcom/localytics/android/MarketingDialogFragment$1$1;->val$url:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 382
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$1$1;->val$mWebView:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$1$1;->val$url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->loadUrl(Ljava/lang/String;)V

    .line 383
    return-void
.end method
