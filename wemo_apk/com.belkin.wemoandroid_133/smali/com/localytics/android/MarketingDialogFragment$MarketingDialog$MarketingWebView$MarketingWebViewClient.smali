.class final Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;
.super Landroid/webkit/WebViewClient;
.source "MarketingDialogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "MarketingWebViewClient"
.end annotation


# instance fields
.field private final mActivity:Landroid/app/Activity;

.field final synthetic this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;


# direct methods
.method constructor <init>(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;Landroid/app/Activity;)V
    .locals 0
    .param p2, "activity"    # Landroid/app/Activity;

    .prologue
    .line 1080
    iput-object p1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    invoke-direct {p0}, Landroid/webkit/WebViewClient;-><init>()V

    .line 1081
    iput-object p2, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->mActivity:Landroid/app/Activity;

    .line 1082
    return-void
.end method


# virtual methods
.method public onPageFinished(Landroid/webkit/WebView;Ljava/lang/String;)V
    .locals 11
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    const/high16 v9, 0x3f000000    # 0.5f

    const/4 v6, 0x0

    .line 1093
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment;->access$200(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/MarketingMessage;

    move-result-object v7

    const-string v8, "location"

    invoke-virtual {v7, v8}, Lcom/localytics/android/MarketingMessage;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1094
    .local v0, "location":Ljava/lang/String;
    const-string v7, "center"

    invoke-virtual {v0, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    const/high16 v7, 0x41200000    # 10.0f

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    shl-int/lit8 v1, v7, 0x1

    .line 1095
    .local v1, "margin":I
    :goto_0
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    sub-int v3, v7, v1

    .line 1096
    .local v3, "maxWidth":I
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v7

    iget v7, v7, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    sub-int v2, v7, v1

    .line 1097
    .local v2, "maxHeight":I
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1300(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)F

    move-result v7

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    div-float v5, v7, v8

    .line 1098
    .local v5, "viewportWidth":F
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1400(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)F

    move-result v7

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    mul-float/2addr v7, v8

    add-float/2addr v7, v9

    float-to-int v7, v7

    invoke-static {v2, v7}, Ljava/lang/Math;->min(II)I

    move-result v7

    int-to-float v7, v7

    iget-object v8, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v8, v8, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v8}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$1200(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/util/DisplayMetrics;

    move-result-object v8

    iget v8, v8, Landroid/util/DisplayMetrics;->density:F

    div-float v4, v7, v8

    .line 1100
    .local v4, "viewportHeight":F
    const-string v7, "javascript:(function() {  var viewportNode = document.createElement(\'meta\');  viewportNode.name    = \'viewport\';  viewportNode.content = \'width=%f, height=%f, user-scalable=no, minimum-scale=.25, maximum-scale=1\';  viewportNode.id      = \'metatag\';  document.getElementsByTagName(\'head\')[0].appendChild(viewportNode);})()"

    const/4 v8, 0x2

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v5}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v9

    aput-object v9, v8, v6

    const/4 v9, 0x1

    invoke-static {v4}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v10

    aput-object v10, v8, v9

    invoke-static {v7, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1109
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment;->access$1100(Lcom/localytics/android/MarketingDialogFragment;)Lcom/localytics/android/JavaScriptClient;

    move-result-object v7

    invoke-virtual {v7}, Lcom/localytics/android/JavaScriptClient;->getJsGlueCode()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {p1, v7}, Landroid/webkit/WebView;->loadUrl(Ljava/lang/String;)V

    .line 1112
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->access$700(Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;)Landroid/widget/RelativeLayout;

    move-result-object v7

    invoke-virtual {v7, v6}, Landroid/widget/RelativeLayout;->setVisibility(I)V

    .line 1113
    iget-object v7, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v7, v7, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    invoke-static {v7}, Lcom/localytics/android/MarketingDialogFragment;->access$1500(Lcom/localytics/android/MarketingDialogFragment;)Ljava/util/concurrent/atomic/AtomicBoolean;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1115
    iget-object v6, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v6, v6, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    invoke-virtual {v6}, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->enterWithAnimation()V

    .line 1117
    :cond_0
    return-void

    .end local v1    # "margin":I
    .end local v2    # "maxHeight":I
    .end local v3    # "maxWidth":I
    .end local v4    # "viewportHeight":F
    .end local v5    # "viewportWidth":F
    :cond_1
    move v1, v6

    .line 1094
    goto/16 :goto_0
.end method

.method public shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
    .locals 2
    .param p1, "view"    # Landroid/webkit/WebView;
    .param p2, "url"    # Ljava/lang/String;

    .prologue
    .line 1087
    iget-object v0, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->this$2:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;

    iget-object v0, v0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView;->this$1:Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;

    iget-object v0, v0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog;->this$0:Lcom/localytics/android/MarketingDialogFragment;

    iget-object v1, p0, Lcom/localytics/android/MarketingDialogFragment$MarketingDialog$MarketingWebView$MarketingWebViewClient;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p2, v1}, Lcom/localytics/android/MarketingDialogFragment;->handleUrl(Ljava/lang/String;Landroid/app/Activity;)Z

    move-result v0

    return v0
.end method
