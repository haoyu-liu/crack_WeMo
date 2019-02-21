.class final Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;
.super Landroid/webkit/WebView;
.source "MarketingDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MarketingWebView"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 7
    .param p2, "context"    # Landroid/content/Context;
    .param p3, "attrs"    # Landroid/util/AttributeSet;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "SetJavaScriptEnabled"
        }
    .end annotation

    .annotation build Landroid/annotation/TargetApi;
        value = 0x10
    .end annotation

    .prologue
    const/4 v6, -0x1

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 1045
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    .line 1046
    invoke-direct {p0, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 1049
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v2

    const/16 v3, 0x13

    if-lt v2, v3, :cond_0

    .line 1051
    const/4 v2, 0x0

    invoke-virtual {p0, v4, v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 1054
    :cond_0
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v0, v6, v6}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 1055
    .local v0, "params":Landroid/widget/LinearLayout$LayoutParams;
    const/16 v2, 0x11

    iput v2, v0, Landroid/widget/LinearLayout$LayoutParams;->gravity:I

    .line 1056
    invoke-virtual {p0, v0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1058
    invoke-virtual {p0, v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setBackgroundColor(I)V

    .line 1059
    invoke-virtual {p0, v4}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setInitialScale(I)V

    .line 1060
    invoke-virtual {p0, v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setHorizontalScrollBarEnabled(Z)V

    .line 1061
    invoke-virtual {p0, v5}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setVerticalScrollBarEnabled(Z)V

    .line 1063
    new-instance v2, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;

    iget-object v3, p1, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-virtual {v3}, Lcom/localytics/android/MarketingDialogFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;-><init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;Landroid/app/Activity;)V

    invoke-virtual {p0, v2}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->setWebViewClient(Landroid/webkit/WebViewClient;)V

    .line 1065
    invoke-virtual {p0}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->getSettings()Landroid/webkit/WebSettings;

    move-result-object v1

    .line 1066
    .local v1, "settings":Landroid/webkit/WebSettings;
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setJavaScriptEnabled(Z)V

    .line 1067
    iget-object v2, p1, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v2}, Lcom/localytics/android/MarketingDialogFragment;->access$1100(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/JavaScriptClient;

    move-result-object v2

    const-string v3, "localytics"

    invoke-virtual {p0, v2, v3}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->addJavascriptInterface(Ljava/lang/Object;Ljava/lang/String;)V

    .line 1068
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setUseWideViewPort(Z)V

    .line 1069
    invoke-static {}, Lcom/localytics/android/DatapointHelper;->getApiLevel()I

    move-result v2

    const/16 v3, 0x10

    if-lt v2, v3, :cond_1

    .line 1071
    invoke-virtual {v1, v4}, Landroid/webkit/WebSettings;->setAllowUniversalAccessFromFileURLs(Z)V

    .line 1073
    :cond_1
    return-void
.end method
